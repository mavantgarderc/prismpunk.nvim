local M = {}

local H = require("prismpunk.core.highlights")
local hl = H.hl
local merge = H.merge
local get_style = H.get_style

function M.apply(c, config)
  if not c or not c.diff or not c.ui then
    H.warn("git.lua: missing color structure (diff/ui)")
    return
  end

  local s = c
  local styles = (config and config.styles) or {}
  local git_styles = get_style(styles, "git")

  local style_add = git_styles.add or {}
  local style_change = git_styles.change or {}
  local style_delete = git_styles.delete or {}

  -- CORE DIFF HIGHLIGHTS (BUILTIN)
  ---------------------------------------------------------------------------
  hl(
    "DiffAdd",
    merge({
      fg = s.diff.add,
      bg = s.ui.bg,
    }, style_add)
  )

  hl(
    "DiffChange",
    merge({
      fg = s.diff.change,
      bg = s.ui.bg,
    }, style_change)
  )

  hl(
    "DiffDelete",
    merge({
      fg = s.diff.delete,
      bg = s.ui.bg,
    }, style_delete)
  )

  hl(
    "DiffText",
    merge({
      fg = s.diff.text,
      bg = s.ui.bg_dim,
    }, style_change)
  )

  -- GITSIGNS-LIKE GROUPS (EXISTING IN THEME)
  ---------------------------------------------------------------------------
  hl("GitSignsAdd", merge({ fg = s.diff.add }, style_add))
  hl("GitSignsChange", merge({ fg = s.diff.change }, style_change))
  hl("GitSignsDelete", merge({ fg = s.diff.delete }, style_delete))

  hl(
    "GitSignsAddInline",
    merge({
      fg = s.diff.add_inline or s.diff.add,
      reverse = true,
    }, style_add)
  )

  hl(
    "GitSignsChangeInline",
    merge({
      fg = s.diff.change_inline or s.diff.change,
      reverse = true,
    }, style_change)
  )

  hl(
    "GitSignsDeleteInline",
    merge({
      fg = s.diff.delete_inline or s.diff.delete,
      reverse = true,
    }, style_delete)
  )
end

return M
