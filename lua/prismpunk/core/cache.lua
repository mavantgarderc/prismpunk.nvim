--- PrismPunk Cache Module
--- Unified caching with memory + optional disk persistence
local M = {}

M._instances = {}

local function get_cache_dir()
  return vim.fn.stdpath("cache") .. "/prismpunk"
end

local function get_cache_path(namespace, key)
  local dir = get_cache_dir() .. "/" .. namespace
  vim.fn.mkdir(dir, "p")
  return dir .. "/" .. key .. ".lua"
end

local function get_mtime(path)
  local stat = vim.loop.fs_stat(path)
  return stat and stat.mtime.sec or nil
end

local function sha256_hash(data)
  return vim.fn.sha256(vim.inspect(data))
end

local Cache = {}
Cache.__index = Cache

function Cache.new(opts)
  opts = opts or {}
  local self = setmetatable({}, Cache)
  
  self.namespace = opts.namespace or "default"
  self.enable_disk = opts.enable_disk ~= false
  self.store = {}
  self.stats = { hits = 0, misses = 0 }
  
  return self
end

function Cache:get(key)
  if self.store[key] then
    self.stats.hits = self.stats.hits + 1
    return self.store[key], "memory"
  end
  
  if self.enable_disk then
    local disk_value = self:load_from_disk(key)
    if disk_value then
      self.store[key] = disk_value
      self.stats.hits = self.stats.hits + 1
      return disk_value, "disk"
    end
  end
  
  self.stats.misses = self.stats.misses + 1
  return nil, nil
end

function Cache:set(key, value)
  self.store[key] = value
  
  if self.enable_disk then
    self:save_to_disk(key, value)
  end
  
  return value
end

function Cache:has(key)
  return self.store[key] ~= nil or (self.enable_disk and self:disk_exists(key))
end

function Cache:delete(key)
  self.store[key] = nil
  
  if self.enable_disk then
    local path = get_cache_path(self.namespace, key)
    if vim.fn.filereadable(path) == 1 then
      vim.fn.delete(path)
    end
  end
end

function Cache:clear()
  self.store = {}
  self.stats.hits = 0
  self.stats.misses = 0
  
  if self.enable_disk then
    local dir = get_cache_dir() .. "/" .. self.namespace
    if vim.fn.isdirectory(dir) == 1 then
      vim.fn.delete(dir, "rf")
    end
  end
end

function Cache:stats_snapshot()
  return {
    hits = self.stats.hits,
    misses = self.stats.misses,
    size = vim.tbl_count(self.store),
    namespace = self.namespace,
  }
end

function Cache:load_from_disk(key)
  local path = get_cache_path(self.namespace, key)
  
  if vim.fn.filereadable(path) == 0 then
    return nil
  end
  
  local ok, data = pcall(dofile, path)
  if ok and type(data) == "table" then
    return data
  end
  
  return nil
end

function Cache:save_to_disk(key, value)
  local path = get_cache_path(self.namespace, key)
  
  local ok, serialized = pcall(function()
    return "return " .. vim.inspect(value)
  end)
  
  if not ok then
    return false
  end
  
  local file = io.open(path, "w")
  if file then
    file:write(serialized)
    file:close()
    return true
  end
  
  return false
end

function Cache:disk_exists(key)
  local path = get_cache_path(self.namespace, key)
  return vim.fn.filereadable(path) == 1
end

function Cache:get_disk_mtime(key)
  local path = get_cache_path(self.namespace, key)
  return get_mtime(path)
end

function Cache:validate_disk_cache(key, source_mtime)
  if not source_mtime then
    return true
  end
  
  local cache_mtime = self:get_disk_mtime(key)
  if not cache_mtime then
    return false
  end
  
  return cache_mtime >= source_mtime
end

function M.new(opts)
  return Cache.new(opts)
end

function M.get_instance(name, opts)
  if not M._instances[name] then
    opts = opts or {}
    opts.namespace = opts.namespace or name
    M._instances[name] = M.new(opts)
  end
  return M._instances[name]
end

function M.clear_all()
  for name, instance in pairs(M._instances) do
    instance:clear()
  end
  M._instances = {}
end

function M.hash(data)
  return sha256_hash(data)
end

function M.get_mtime(path)
  return get_mtime(path)
end

M.Cache = Cache

return M
