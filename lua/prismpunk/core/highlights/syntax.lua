local M = {}

local H = require("prismpunk.core.highlights")
local hl = H.hl
local merge = H.merge

function M.apply(c, config)
  if not c or not c.syn or not c.ui then
    H.warn("syntax.lua: missing color structure (syn/ui)")
    return
  end

  local s = c

  local styles = (config and config.styles) or {}
  local comment_style = styles.comments or {}
  local keyword_style = styles.keywords or {}
  local function_style = styles.functions or {}
  local variable_style = styles.variables or {}
  local types_style = styles.types or {}
  local constants_style = styles.constants or {}

  local function get_color(key, fallback) return s.syn[key] or fallback or s.ui.fg end

  -- COMMENTS
  ---------------------------------------------------------------------------
  hl("Comment", merge({ fg = get_color("comment") }, comment_style))

  -- CONSTANTS
  ---------------------------------------------------------------------------
  hl("Constant", merge({ fg = get_color("constant") }, constants_style))
  hl("String", { fg = get_color("string") })
  hl("Character", { fg = get_color("string") })
  hl("Number", merge({ fg = get_color("number") }, constants_style))
  hl("Boolean", merge({ fg = get_color("constant") }, constants_style))
  hl("Float", merge({ fg = get_color("number") }, constants_style))

  -- IDENTIFIERS / FUNCTIONS
  ---------------------------------------------------------------------------
  hl("Identifier", merge({ fg = get_color("variable", get_color("identifier")) }, variable_style))
  hl("Function", merge({ fg = get_color("func") }, function_style))

  -- STATEMENTS / KEYWORDS
  ---------------------------------------------------------------------------
  hl("Statement", { fg = get_color("statement", get_color("keyword")) })
  hl("Conditional", { fg = get_color("keyword") })
  hl("Repeat", { fg = get_color("keyword") })
  hl("Label", { fg = get_color("keyword") })
  hl("Operator", { fg = get_color("operator") })
  hl("Keyword", merge({ fg = get_color("keyword") }, keyword_style))
  hl("Exception", { fg = get_color("keyword") })

  -- PREPROCESSOR
  ---------------------------------------------------------------------------
  hl("PreProc", { fg = get_color("preproc", get_color("type")) })
  hl("Include", { fg = get_color("func") })
  hl("Define", { fg = get_color("keyword") })
  hl("Macro", { fg = get_color("variable", get_color("identifier")) })
  hl("PreCondit", { fg = get_color("type") })

  -- TYPES
  ---------------------------------------------------------------------------
  hl("Type", merge({ fg = get_color("type") }, types_style))
  hl("StorageClass", merge({ fg = get_color("type") }, types_style))
  hl("Structure", merge({ fg = get_color("keyword") }, types_style))
  hl("Typedef", merge({ fg = get_color("type") }, types_style))

  -- SPECIAL / MISC
  ---------------------------------------------------------------------------
  hl("Special", { fg = get_color("special") })
  hl("SpecialChar", { fg = get_color("special") })
  hl("Tag", { fg = get_color("type") })
  hl("Delimiter", { fg = get_color("punct", get_color("operator")) })
  hl("SpecialComment", { fg = get_color("special") })

  hl("Debug", {
    fg = (s.diag and s.diag.error) or "#ff0000",
  })

  -- GENERIC / MISC GROUPS
  ---------------------------------------------------------------------------
  hl("Underlined", { underline = true })
  hl("Ignore", { fg = s.ui.bg })
  hl("Error", {
    fg = (s.diag and s.diag.error) or "#ff0000",
  })
  hl("Todo", {
    fg = get_color("special"),
    bold = true,
  })
end

return M
