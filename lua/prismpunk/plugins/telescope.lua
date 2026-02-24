--- PrismPunk Telescope integration
--- Provides a Telescope picker for selecting color schemes
local M = {}

local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then return M end

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local loader = require("prismpunk.loader")

--- Open a Telescope picker to select a PrismPunk color scheme
--- @param opts table|nil Telescope options
function M.schemes(opts)
  opts = opts or {}

  local schemes = loader.list_schemes()
  if #schemes == 0 then
    vim.notify("[prismpunk] No schemes found", vim.log.levels.WARN)
    return
  end

  table.sort(schemes)

  pickers
    .new(opts, {
      prompt_title = "PrismPunk Schemes",
      finder = finders.new_table({
        results = schemes,
        entry_maker = function(entry)
          return {
            value = entry,
            display = entry,
            ordinal = entry,
          }
        end,
      }),
      sorter = conf.generic_sorter(opts),
      previewer = nil,
      attach_mappings = function(prompt_bufnr)
        actions.select_default:replace(function()
          local selection = action_state.get_selected_entry()
          if selection then
            actions.close(prompt_bufnr)
            local ok, err = require("prismpunk").load(selection.value, { force_reload = true })
            if not ok then
              vim.notify("[prismpunk] Failed to load scheme: " .. tostring(err), vim.log.levels.ERROR)
            else
              vim.notify("[prismpunk] Loaded scheme: " .. selection.value, vim.log.levels.INFO)
            end
          end
        end)
        return true
      end,
    })
    :find()
end

return M
