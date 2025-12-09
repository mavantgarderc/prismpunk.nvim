-- prismpunk/core/highlights/lsp.lua
local M = {}

local H = require("prismpunk.core.highlights")
local hl = H.hl
local merge = H.merge
local get_style = H.get_style

function M.apply(c, config)
  if not c or not c.syn or not c.ui or not c.diag then
    H.warn("lsp.lua: missing color structure (syn/ui/diag)")
    return
  end

  local s = c

  local styles = (config and config.styles) or {}
  local lsp_styles = get_style(styles, "lsp")
  local ref_style = lsp_styles.references or {}
  local inlay_style = lsp_styles.inlay_hints or {}
  local codelens_style = lsp_styles.codelens or {}

  -- LSP SEMANTIC TOKENS: TYPES
  ---------------------------------------------------------------------------
  hl("@lsp.type.function", { link = "@function" })
  hl("@lsp.type.method", { link = "@function" })
  hl("@lsp.type.variable", { link = "@variable" })
  hl("@lsp.type.parameter", { link = "@variable.parameter" })
  hl("@lsp.type.type", { link = "@type" })
  hl("@lsp.type.keyword", { link = "@keyword" })
  hl("@lsp.type.number", { link = "@number" })
  hl("@lsp.type.string", { link = "@string" })
  hl("@lsp.type.operator", { link = "@operator" })

  hl("@lsp.type.class", { fg = s.syn.type })
  hl("@lsp.type.interface", { fg = s.syn.type })
  hl("@lsp.type.struct", { fg = s.syn.type })
  hl("@lsp.type.enum", { fg = s.syn.type })
  hl("@lsp.type.enumMember", { fg = s.syn.constant })
  hl("@lsp.type.namespace", { fg = s.syn.type })
  hl("@lsp.type.typeParameter", { fg = s.syn.type })
  hl("@lsp.type.modifier", { fg = s.syn.keyword })

  hl("@lsp.type.property", { fg = s.syn.variable })
  hl("@lsp.type.object", { fg = s.syn.type })
  hl("@lsp.type.array", { fg = s.syn.type })
  hl("@lsp.type.key", { fg = s.syn.variable })

  hl("@lsp.type.macro", { fg = s.syn.special })
  hl("@lsp.type.decorator", { fg = s.syn.func })
  hl("@lsp.type.event", { fg = s.syn.func })
  hl("@lsp.type.regexp", { fg = s.syn.special })
  hl("@lsp.type.boolean", { link = "@boolean" })
  hl("@lsp.type.null", { fg = s.syn.constant })
  hl("@lsp.type.comment", { link = "@comment" })

  hl("@lsp.type.builtinType", { fg = s.syn.type })
  hl("@lsp.type.selfParameter", { fg = s.syn.variable })
  hl("@lsp.type.enumConstant", { fg = s.syn.constant })
  hl("@lsp.type.unresolvedReference", { fg = s.diag.warning })
  hl("@lsp.type.package", { fg = s.syn.type })
  hl("@lsp.type.typeAlias", { fg = s.syn.type })
  hl("@lsp.type.label", { fg = s.syn.special })

  hl("@lsp.type.field", { fg = s.syn.variable })
  hl("@lsp.type.value", { fg = s.syn.constant })
  hl("@lsp.type.unit", { fg = s.syn.number })
  hl("@lsp.type.expression", { fg = s.ui.fg })

  -- LSP SEMANTIC TOKENS: MODIFIERS
  ---------------------------------------------------------------------------
  hl("@lsp.mod.abstract", { italic = true })
  hl("@lsp.mod.async", { fg = s.syn.keyword })
  hl("@lsp.mod.declaration", { underline = true })
  hl("@lsp.mod.definition", { bold = true })
  hl("@lsp.mod.deprecated", { strikethrough = true })
  hl("@lsp.mod.documentation", { fg = s.syn.comment })
  hl("@lsp.mod.modification", { underline = true })
  hl("@lsp.mod.readonly", { fg = s.syn.constant })
  hl("@lsp.mod.defaultLibrary", { fg = s.syn.constant })
  hl("@lsp.mod.static", { fg = s.syn.type })

  -- LSP UX: REFERENCES, INLAY HINTS, CODELENS, INFO, PROGRESS
  ---------------------------------------------------------------------------

  hl("LspReferenceText", merge({ bg = s.ui.bg_highlight }, ref_style))
  hl("LspReferenceRead", merge({ bg = s.ui.bg_highlight }, ref_style))
  hl("LspReferenceWrite", merge({ bg = s.ui.bg_highlight, underline = true }, ref_style))
  hl("LspReferenceTarget", merge({ fg = s.syn.keyword, bold = true }, ref_style))

  hl("LspInlayHint", merge({ fg = s.syn.comment, bg = s.ui.bg_dim }, inlay_style))
  hl("LspInlayHintType", { link = "LspInlayHint" })
  hl("LspInlayHintParameter", { link = "LspInlayHint" })

  hl("LspCodeLens", merge({ fg = s.syn.comment }, codelens_style))
  hl("LspLens", merge({ fg = s.syn.comment }, codelens_style))
  hl("LspCodeLensSeparator", merge({ fg = s.ui.nontext or s.ui.bg_highlight }, codelens_style))

  hl("LspInfoBorder", { fg = s.ui.border, bg = s.ui.bg_dim })
  hl("LspInfoTitle", { fg = s.syn.keyword, bold = true })

  hl("LspProgressFg", { fg = s.syn.type })

  hl("LspSignatureActiveParameter", { fg = s.syn.func, underline = true })
end

return M
