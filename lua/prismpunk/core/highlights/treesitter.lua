local M = {}

local H = require("prismpunk.core.highlights")
local hl = H.hl
local merge = H.merge

function M.apply(c, config)
  if not c or not c.syn or not c.ui or not c.diag or not c.diff then
    H.warn("treesitter.lua: missing color structure (syn/ui/diag/diff)")
    return
  end

  local s = c
  local styles = (config and config.styles) or {}

  local var_style = styles.variables or {}
  local param_style = styles.parameters or {}
  local comment_style = styles.comments or {}
  local constants_style = styles.constants or {}
  local types_style = styles.types or {}

  -- VARIABLES / FIELDS / PROPERTIES
  ---------------------------------------------------------------------------
  hl("@variable", merge({ fg = s.syn.variable }, var_style))
  hl("@variable.builtin", merge({ fg = s.syn.special }, constants_style))
  hl("@variable.parameter", merge({ fg = s.syn.parameter }, param_style))
  hl("@variable.parameter.builtin", merge({ fg = s.syn.keyword }, param_style))
  hl("@variable.member", merge({ fg = s.syn.variable }, var_style))
  hl("@field", merge({ fg = s.syn.variable }, var_style))
  hl("@property", merge({ fg = s.syn.variable }, var_style))

  -- CONSTANTS / MODULES / LABELS
  ---------------------------------------------------------------------------
  hl("@constant", merge({ fg = s.syn.constant }, constants_style))
  hl("@constant.builtin", merge({ fg = s.syn.constant }, constants_style))
  hl("@constant.macro", { fg = s.syn.special })

  hl("@module", merge({ fg = s.syn.type }, types_style))
  hl("@module.builtin", merge({ fg = s.syn.type }, types_style))
  hl("@label", { fg = s.syn.special })

  -- FUNCTIONS / METHODS / CONSTRUCTORS
  ---------------------------------------------------------------------------
  hl("@function", { link = "Function" })
  hl("@function.call", { fg = s.syn.func })
  hl("@function.builtin", { fg = s.syn.func })
  hl("@function.macro", { fg = s.syn.special })

  hl("@method", { fg = s.syn.method })
  hl("@method.call", { fg = s.syn.method })

  hl("@function.method", { link = "@method" })
  hl("@function.method.call", { link = "@method.call" })

  hl("@constructor", merge({ fg = s.syn.type }, types_style))

  -- OPERATORS / KEYWORDS
  ---------------------------------------------------------------------------
  hl("@operator", { link = "Operator" })

  hl("@keyword", { link = "Keyword" })
  hl("@keyword.return", { fg = s.syn.keyword })
  hl("@keyword.function", { fg = s.syn.keyword })
  hl("@keyword.operator", { fg = s.syn.operator })
  hl("@keyword.coroutine", { fg = s.syn.keyword })

  hl("@keyword.conditional", { fg = s.syn.keyword })
  hl("@keyword.conditional.ternary", { fg = s.syn.operator })

  hl("@keyword.repeat", { fg = s.syn.keyword })
  hl("@keyword.import", { fg = s.syn.keyword })
  hl("@keyword.type", { fg = s.syn.keyword })
  hl("@keyword.modifier", { fg = s.syn.keyword })
  hl("@keyword.debug", { fg = s.syn.keyword })
  hl("@keyword.exception", { fg = s.syn.keyword })

  hl("@keyword.directive", { fg = s.syn.keyword })
  hl("@keyword.directive.define", { fg = s.syn.keyword })

  -- STRINGS / CHARACTERS / NUMBERS
  ---------------------------------------------------------------------------
  hl("@string", { link = "String" })
  hl("@string.documentation", merge({ fg = s.syn.comment }, comment_style))
  hl("@string.regexp", { fg = s.syn.special })
  hl("@string.escape", { fg = s.syn.special })
  hl("@string.special", { fg = s.syn.special })
  hl("@string.special.symbol", { fg = s.syn.special })
  hl("@string.special.path", { fg = s.syn.string or s.syn.special })
  hl("@string.special.url", { fg = s.syn.string or s.syn.special, underline = true })

  hl("@character", { fg = s.syn.string })
  hl("@character.special", { fg = s.syn.special })

  hl("@boolean", { link = "Boolean" })
  hl("@number", { link = "Number" })
  hl("@number.float", { fg = s.syn.number })

  -- TYPES / ATTRIBUTES
  ---------------------------------------------------------------------------
  hl("@type", { link = "Type" })
  hl("@type.builtin", merge({ fg = s.syn.type }, types_style))
  hl("@type.definition", merge({ fg = s.syn.type }, types_style))
  hl("@type.qualifier", merge({ fg = s.syn.keyword }, types_style))

  hl("@attribute", merge({ fg = s.syn.attribute or s.syn.type }, types_style))
  hl("@attribute.builtin", merge({ fg = s.syn.attribute or s.syn.type }, types_style))

  -- PUNCTUATION
  ---------------------------------------------------------------------------
  hl("@punctuation.delimiter", { fg = s.syn.punct })
  hl("@punctuation.bracket", { fg = s.syn.punct })
  hl("@punctuation.special", { fg = s.syn.special })
  hl("@punctuation.special.method", { fg = s.syn.operator })
  hl("@punctuation.special.property", { fg = s.syn.operator })

  -- COMMENTS
  ---------------------------------------------------------------------------
  hl("@comment", { link = "Comment", italic = true })
  hl("@comment.documentation", merge({ fg = s.syn.comment }, comment_style))

  hl("@comment.error", { fg = s.diag.error })
  hl("@comment.warning", { fg = s.diag.warning })
  hl("@comment.todo", { fg = s.syn.special })
  hl("@comment.note", { fg = s.syn.comment })

  -- MARKUP (CANONICAL)
  ---------------------------------------------------------------------------
  hl("@markup.strong", { bold = true })
  hl("@markup.italic", { italic = true })
  hl("@markup.strikethrough", { strikethrough = true })
  hl("@markup.underline", { underline = true })

  hl("@markup.heading", { fg = s.syn.keyword, bold = true })
  hl("@markup.heading.1", { fg = s.syn.keyword, bold = true })
  hl("@markup.heading.2", { fg = s.syn.type, bold = true })
  hl("@markup.heading.3", { fg = s.syn.func, bold = true })
  hl("@markup.heading.4", { fg = s.syn.variable, bold = true })
  hl("@markup.heading.5", { fg = s.syn.constant, bold = true })
  hl("@markup.heading.6", { fg = s.syn.special, bold = true })

  hl("@markup.quote", { fg = s.syn.comment, italic = true })
  hl("@markup.math", { fg = s.syn.special })

  hl("@markup.link", { fg = s.syn.special, underline = true })
  hl("@markup.link.label", { fg = s.syn.special })
  hl("@markup.link.url", { fg = s.syn.string or s.syn.special, underline = true })

  hl("@markup.environment", { fg = s.syn.type })
  hl("@markup.environment.name", { fg = s.syn.keyword })

  hl("@markup.raw", { fg = s.syn.string })
  hl("@markup.raw.block", { fg = s.syn.string })

  hl("@markup.list", { fg = s.syn.special })
  hl("@markup.list.checked", { fg = s.syn.type })
  hl("@markup.list.unchecked", { fg = s.syn.comment })

  hl("@markup.code", { fg = s.syn.string })
  hl("@markup.inline", { fg = s.ui.fg })
  hl("@markup.block", { fg = s.syn.type })

  -- DIFF (TREESITTER)
  ---------------------------------------------------------------------------
  hl("@diff.plus", { fg = s.diff.add })
  hl("@diff.minus", { fg = s.diff.delete })
  hl("@diff.delta", { fg = s.diff.change })

  -- TAGS
  ---------------------------------------------------------------------------
  hl("@tag", { fg = s.syn.type })
  hl("@tag.builtin", { fg = s.syn.type })
  hl("@tag.attribute", { fg = s.syn.variable })
  hl("@tag.delimiter", { fg = s.syn.operator })

  -- DIAGNOSTIC / TODO / NONE
  ---------------------------------------------------------------------------
  hl("@error", { fg = s.diag.error })
  hl("@todo", { fg = s.syn.special })

  hl("@none", { fg = "NONE" })

  -- TEXT GROUPS (LINKED TO MARKUP, COMPAT LAYER)
  ---------------------------------------------------------------------------
  hl("@text", { link = "@markup" })
  hl("@text.emphasis", { link = "@markup.italic" })
  hl("@text.strong", { link = "@markup.strong" })
  hl("@text.underline", { link = "@markup.underline" })
  hl("@text.strike", { link = "@markup.strikethrough" })

  hl("@text.title", { link = "@markup.heading" })
  hl("@text.literal", { link = "@markup.raw" })
  hl("@text.uri", { link = "@markup.link.url" })
  hl("@text.reference", { link = "@markup.link" })
  hl("@text.math", { link = "@markup.math" })

  hl("@text.environment", { link = "@markup.environment" })
  hl("@text.environment.name", { link = "@markup.environment.name" })

  hl("@text.note", { fg = s.syn.comment })
  hl("@text.warning", { fg = s.diag.warning })
  hl("@text.danger", { fg = s.diag.error })
  hl("@text.success", { fg = s.diff.add })
  hl("@text.todo", { link = "@comment.todo" })

  -- SPELL
  ---------------------------------------------------------------------------
  hl("@spell", { link = "Normal" })

  -- PARAMETERS
  ---------------------------------------------------------------------------
  hl("@parameter", merge({ fg = s.syn.parameter }, param_style))
  hl("@parameter.reference", { fg = s.syn.parameter })

  -- MARKDOWN / MARKUP SPECIALS
  ---------------------------------------------------------------------------
  hl("@text.literal.block.markdown", { fg = s.syn.string })
  hl("@text.literal.markdown_inline", { fg = s.syn.string })

  -- LANGUAGE-SPECIFIC OVERRIDES
  ---------------------------------------------------------------------------
  -- Python: self, cls, __dunder__ methods should be distinct
  hl("@variable.builtin.python", merge({ fg = s.syn.keyword }, var_style))
  hl("@variable.parameter.python", merge({ fg = s.syn.parameter }, param_style))

  -- JavaScript/TypeScript: this, super, arguments should be distinct
  hl("@variable.builtin.javascript", merge({ fg = s.syn.keyword }, var_style))
  hl("@variable.builtin.typescript", merge({ fg = s.syn.keyword }, var_style))
  hl("@variable.builtin.javascriptreact", merge({ fg = s.syn.keyword }, var_style))
  hl("@variable.builtin.typescriptreact", merge({ fg = s.syn.keyword }, var_style))

  -- Lua: self in methods
  hl("@variable.builtin.lua", merge({ fg = s.syn.keyword }, var_style))

  -- Ruby: self, super
  hl("@variable.builtin.ruby", merge({ fg = s.syn.keyword }, var_style))

  -- Rust: self, Self
  hl("@variable.builtin.rust", merge({ fg = s.syn.keyword }, var_style))

  -- Go: nil, true, false as builtins
  hl("@constant.builtin.go", merge({ fg = s.syn.constant }, constants_style))

  -- C/C++: this pointer
  hl("@variable.builtin.c", merge({ fg = s.syn.keyword }, var_style))
  hl("@variable.builtin.cpp", merge({ fg = s.syn.keyword }, var_style))
end

return M
