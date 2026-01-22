-- prismpunk/core/highlights/lsp.lua
local M = {}

local H = require("prismpunk.core.highlights")
local hl = H.hl
local merge = H.merge

function M.apply(c, config)
  if not c or not c.syn or not c.ui or not c.diag then
    H.warn("lsp.lua: missing color structure (syn/ui/diag)")
    return
  end

  local s = c
  local styles = (config and config.styles) or {}

  local var_style = styles.variables or {}
  local param_style = styles.parameters or {}
  local constants_style = styles.constants or {}
  local types_style = styles.types or {}
  local func_style = styles.functions or {}

  -- LSP SEMANTIC TOKENS - TYPES
  ---------------------------------------------------------------------------
  hl("@lsp.type.class", merge({ fg = s.syn.type }, types_style))
  hl("@lsp.type.decorator", { fg = s.syn.special })
  hl("@lsp.type.enum", merge({ fg = s.syn.type }, types_style))
  hl("@lsp.type.enumMember", merge({ fg = s.syn.constant }, constants_style))
  hl("@lsp.type.function", merge({ fg = s.syn.func }, func_style))
  hl("@lsp.type.interface", merge({ fg = s.syn.type }, types_style))
  hl("@lsp.type.macro", { fg = s.syn.special })
  hl("@lsp.type.method", merge({ fg = s.syn.method }, func_style))
  hl("@lsp.type.namespace", merge({ fg = s.syn.type }, types_style))
  hl("@lsp.type.parameter", merge({ fg = s.syn.parameter }, param_style))
  hl("@lsp.type.property", merge({ fg = s.syn.variable }, var_style))
  hl("@lsp.type.struct", merge({ fg = s.syn.type }, types_style))
  hl("@lsp.type.type", merge({ fg = s.syn.type }, types_style))
  hl("@lsp.type.typeParameter", merge({ fg = s.syn.type }, types_style))
  hl("@lsp.type.variable", merge({ fg = s.syn.variable }, var_style))

  -- LSP SEMANTIC TOKENS - MODIFIERS
  ---------------------------------------------------------------------------
  hl("@lsp.mod.readonly", merge({ fg = s.syn.constant }, constants_style))
  hl("@lsp.mod.constant", merge({ fg = s.syn.constant }, constants_style))
  hl("@lsp.mod.static", merge({ fg = s.syn.constant }, constants_style))
  hl("@lsp.mod.deprecated", { fg = s.syn.deprecated or s.ui.fg_dim, strikethrough = true })
  hl("@lsp.mod.abstract", { fg = s.syn.type, italic = true })
  hl("@lsp.mod.async", { fg = s.syn.keyword, italic = true })
  hl("@lsp.mod.declaration", { fg = s.syn.type })
  hl("@lsp.mod.defaultLibrary", { fg = s.syn.special })
  hl("@lsp.mod.definition", { fg = s.syn.type })
  hl("@lsp.mod.documentation", { fg = s.syn.comment })
  hl("@lsp.mod.modification", { fg = s.syn.keyword })
  hl("@lsp.mod.readonly", { fg = s.syn.constant })

  -- PYTHON-SPECIFIC LSP SEMANTIC TOKENS
  ---------------------------------------------------------------------------
  -- The critical fix for Python's 'self' keyword
  hl("@lsp.type.selfKeyword.python", { fg = s.syn.keyword, italic = true })
  hl("@lsp.type.clsKeyword.python", { fg = s.syn.keyword, italic = true })
  hl("@lsp.type.clsKeyword.python", { fg = s.syn.keyword, italic = true })

  -- Python built-in types and functions
  hl("@lsp.type.builtinType.python", merge({ fg = s.syn.type }, types_style))
  hl("@lsp.type.builtinConstant.python", merge({ fg = s.syn.constant }, constants_style))

  -- Python decorators
  hl("@lsp.type.decorator.python", { fg = s.syn.special })
  hl("@lsp.typemod.function.decorator.python", { fg = s.syn.special })

  -- Python magic methods (dunder methods)
  hl("@lsp.typemod.method.dunder.python", { fg = s.syn.special })

  -- Python parameters (including self, cls when used as parameters)
  hl("@lsp.type.parameter.python", merge({ fg = s.syn.parameter }, param_style))
  hl("@lsp.typemod.parameter.builtin.python", { fg = s.syn.keyword, italic = true })

  -- JAVASCRIPT/TYPESCRIPT-SPECIFIC LSP SEMANTIC TOKENS
  ---------------------------------------------------------------------------
  -- 'this' keyword
  hl("@lsp.type.selfKeyword.javascript", { fg = s.syn.keyword })
  hl("@lsp.type.selfKeyword.typescript", { fg = s.syn.keyword })
  hl("@lsp.type.selfKeyword.javascriptreact", { fg = s.syn.keyword })
  hl("@lsp.type.selfKeyword.typescriptreact", { fg = s.syn.keyword })

  -- TypeScript-specific
  hl("@lsp.type.typeAlias.typescript", merge({ fg = s.syn.type }, types_style))
  hl("@lsp.type.typeAlias.typescriptreact", merge({ fg = s.syn.type }, types_style))

  -- RUST-SPECIFIC LSP SEMANTIC TOKENS
  ---------------------------------------------------------------------------
  -- 'self' and 'Self' in Rust
  hl("@lsp.type.selfKeyword.rust", { fg = s.syn.keyword })
  hl("@lsp.type.selfTypeKeyword.rust", { fg = s.syn.keyword })

  -- Rust lifetimes
  hl("@lsp.type.lifetime.rust", { fg = s.syn.special })

  -- Rust attributes
  hl("@lsp.type.attributeBracket.rust", { fg = s.syn.special })
  hl("@lsp.type.builtinAttribute.rust", { fg = s.syn.special })

  -- Rust macros
  hl("@lsp.type.macro.rust", { fg = s.syn.special })
  hl("@lsp.typemod.macro.defaultLibrary.rust", { fg = s.syn.special })

  -- LUA-SPECIFIC LSP SEMANTIC TOKENS
  ---------------------------------------------------------------------------
  hl("@lsp.type.selfKeyword.lua", { fg = s.syn.keyword })

  -- GO-SPECIFIC LSP SEMANTIC TOKENS
  ---------------------------------------------------------------------------
  -- Go built-in functions
  hl("@lsp.type.builtinFunction.go", { fg = s.syn.func })
  hl("@lsp.type.builtinConstant.go", merge({ fg = s.syn.constant }, constants_style))

  -- C/C++-SPECIFIC LSP SEMANTIC TOKENS
  ---------------------------------------------------------------------------
  -- 'this' pointer in C++
  hl("@lsp.type.selfKeyword.cpp", { fg = s.syn.keyword })

  -- C/C++ preprocessor
  hl("@lsp.type.macro.c", { fg = s.syn.special })
  hl("@lsp.type.macro.cpp", { fg = s.syn.special })

  -- RUBY-SPECIFIC LSP SEMANTIC TOKENS
  ---------------------------------------------------------------------------
  hl("@lsp.type.selfKeyword.ruby", { fg = s.syn.keyword })

  -- GENERIC LSP TYPE MODIFIERS (CROSS-LANGUAGE)
  ---------------------------------------------------------------------------
  -- Readonly/constant combinations
  hl("@lsp.typemod.variable.readonly", merge({ fg = s.syn.constant }, constants_style))
  hl("@lsp.typemod.property.readonly", merge({ fg = s.syn.constant }, constants_style))

  -- Global scope
  hl("@lsp.typemod.variable.global", { fg = s.syn.special })
  hl("@lsp.typemod.function.global", { fg = s.syn.func })

  -- Default library (built-ins)
  hl("@lsp.typemod.function.defaultLibrary", { fg = s.syn.func })
  hl("@lsp.typemod.variable.defaultLibrary", { fg = s.syn.special })
  hl("@lsp.typemod.type.defaultLibrary", merge({ fg = s.syn.type }, types_style))

  -- Static members
  hl("@lsp.typemod.method.static", merge({ fg = s.syn.func }, func_style))
  hl("@lsp.typemod.property.static", merge({ fg = s.syn.constant }, constants_style))
  hl("@lsp.typemod.variable.static", merge({ fg = s.syn.constant }, constants_style))

  -- LSP DIAGNOSTICS
  ---------------------------------------------------------------------------
  hl("DiagnosticError", { fg = s.diag.error })
  hl("DiagnosticWarn", { fg = s.diag.warning })
  hl("DiagnosticInfo", { fg = s.diag.info })
  hl("DiagnosticHint", { fg = s.diag.hint })
  hl("DiagnosticOk", { fg = s.diag.ok })

  -- Virtual text diagnostics
  hl("DiagnosticVirtualTextError", { fg = s.diag.virtual_text_error, italic = true })
  hl("DiagnosticVirtualTextWarn", { fg = s.diag.virtual_text_warning, italic = true })
  hl("DiagnosticVirtualTextInfo", { fg = s.diag.virtual_text_info, italic = true })
  hl("DiagnosticVirtualTextHint", { fg = s.diag.virtual_text_hint, italic = true })

  -- Underline diagnostics
  hl("DiagnosticUnderlineError", { undercurl = true, sp = s.diag.error })
  hl("DiagnosticUnderlineWarn", { undercurl = true, sp = s.diag.warning })
  hl("DiagnosticUnderlineInfo", { undercurl = true, sp = s.diag.info })
  hl("DiagnosticUnderlineHint", { undercurl = true, sp = s.diag.hint })

  -- Floating window diagnostics
  hl("DiagnosticFloatingError", { fg = s.diag.error })
  hl("DiagnosticFloatingWarn", { fg = s.diag.warning })
  hl("DiagnosticFloatingInfo", { fg = s.diag.info })
  hl("DiagnosticFloatingHint", { fg = s.diag.hint })

  -- Sign column diagnostics
  hl("DiagnosticSignError", { fg = s.diag.error })
  hl("DiagnosticSignWarn", { fg = s.diag.warning })
  hl("DiagnosticSignInfo", { fg = s.diag.info })
  hl("DiagnosticSignHint", { fg = s.diag.hint })

  -- LSP REFERENCES / DOCUMENT HIGHLIGHTS
  ---------------------------------------------------------------------------
  hl("LspReferenceText", { bg = s.ui.bg_highlight })
  hl("LspReferenceRead", { bg = s.ui.bg_highlight })
  hl("LspReferenceWrite", { bg = s.ui.bg_highlight, underline = true })

  -- LSP SIGNATURE HELP
  ---------------------------------------------------------------------------
  hl("LspSignatureActiveParameter", { fg = s.syn.special, bold = true })

  -- LSP CODE LENS
  ---------------------------------------------------------------------------
  hl("LspCodeLens", { fg = s.syn.comment, italic = true })
  hl("LspCodeLensSeparator", { fg = s.syn.comment })

  -- LSP INLAY HINTS
  ---------------------------------------------------------------------------
  hl("LspInlayHint", { fg = s.ui.fg_dim, italic = true, bg = s.ui.bg_m1 })
end

return M
