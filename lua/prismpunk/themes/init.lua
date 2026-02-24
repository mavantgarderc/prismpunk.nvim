--- DEPRECATED: Use prismpunk.schemes instead
--- This module is kept for backwards compatibility only
local warned = false

local function warn_deprecated()
  if not warned then
    warned = true
    vim.notify(
      "[prismpunk] 'require(\"prismpunk.themes\")' is deprecated. Use 'require(\"prismpunk.schemes\")' instead.",
      vim.log.levels.WARN
    )
  end
end

local schemes = require("prismpunk.schemes")

return setmetatable({}, {
  __index = function(_, key)
    warn_deprecated()
    return schemes[key]
  end,
  __call = function(_, ...)
    warn_deprecated()
    return schemes(...)
  end,
})
