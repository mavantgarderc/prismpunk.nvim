local M = {}

local H = require("prismpunk.core.highlights")
local hl = H.hl
local merge = H.merge
local get_style = H.get_style

---@diagnostic disable-next-line: unused-local
function M.apply(c, config)
  if not c or not c.diag or not c.ui or not c.syn then
    H.warn("diagnostic.lua: missing color structure (diag/ui/syn)")
    return
  end

  local s = c

  local styles = (config and config.styles) or {}
  local diag_styles = get_style(styles, "diagnostics") -- always a table

  local severity_styles = {
    error = diag_styles.error or {},
    warn = diag_styles.warn or {},
    info = diag_styles.info or {},
    hint = diag_styles.hint or {},
    ok = diag_styles.ok or {},
  }

  local underline_common = diag_styles.underline or {}
  local vt_common = diag_styles.virtual_text or {}

  -- Base diagnostic colors
  local col_error = s.diag.error
  local col_warn = s.diag.warning
  local col_info = s.diag.info
  local col_hint = s.diag.hint
  -- "Ok" diagnostics reuse a type-ish color by design
  local col_ok = s.syn.type

  -- Virtual text colors with theme-provided overrides
  local vt_error = s.diag.virtual_text_error or col_error
  local vt_warn = s.diag.virtual_text_warning or col_warn
  local vt_info = s.diag.virtual_text_info or col_info
  local vt_hint = s.diag.virtual_text_hint or col_hint
  local vt_ok = s.diag.virtual_text_ok or s.diag.ok or col_ok

  --- Base diagnostic text
  --- @param name string
  --- @param severity "error"|"warn"|"info"|"hint"|"ok"
  --- @param fg string
  local function hl_diag_base(name, severity, fg) hl(name, merge({ fg = fg }, severity_styles[severity])) end

  --- Underline diagnostics
  --- @param name string
  --- @param severity "error"|"warn"|"info"|"hint"|"ok"
  --- @param sp string
  local function hl_diag_underline(name, severity, sp)
    hl(name, merge({ sp = sp, undercurl = true }, underline_common, severity_styles[severity]))
  end

  --- Virtual text diagnostics
  --- @param name string
  --- @param severity "error"|"warn"|"info"|"hint"|"ok"
  --- @param fg string
  local function hl_diag_vt(name, severity, fg)
    hl(name, merge({ fg = fg, bg = s.ui.bg_dim }, vt_common, severity_styles[severity]))
  end

  --- Sign column diagnostics
  --- @param name string
  --- @param severity "error"|"warn"|"info"|"hint"|"ok"
  --- @param fg string
  local function hl_diag_sign(name, severity, fg) hl(name, merge({ fg = fg }, severity_styles[severity])) end

  ---------------------------------------------------------------------------
  -- DIAGNOSTICS HIGHLIGHTS
  ---------------------------------------------------------------------------

  -- Main diagnostic text
  hl_diag_base("DiagnosticError", "error", col_error)
  hl_diag_base("DiagnosticWarn", "warn", col_warn)
  hl_diag_base("DiagnosticInfo", "info", col_info)
  hl_diag_base("DiagnosticHint", "hint", col_hint)
  hl_diag_base("DiagnosticOk", "ok", col_ok)

  -- Underlines
  hl_diag_underline("DiagnosticUnderlineError", "error", col_error)
  hl_diag_underline("DiagnosticUnderlineWarn", "warn", col_warn)
  hl_diag_underline("DiagnosticUnderlineInfo", "info", col_info)
  hl_diag_underline("DiagnosticUnderlineHint", "hint", col_hint)
  hl_diag_underline("DiagnosticUnderlineOk", "ok", col_ok)

  -- Virtual text
  hl_diag_vt("DiagnosticVirtualTextError", "error", vt_error)
  hl_diag_vt("DiagnosticVirtualTextWarn", "warn", vt_warn)
  hl_diag_vt("DiagnosticVirtualTextInfo", "info", vt_info)
  hl_diag_vt("DiagnosticVirtualTextHint", "hint", vt_hint)
  hl_diag_vt("DiagnosticVirtualTextOk", "ok", vt_ok)

  -- Signs
  hl_diag_sign("DiagnosticSignError", "error", col_error)
  hl_diag_sign("DiagnosticSignWarn", "warn", col_warn)
  hl_diag_sign("DiagnosticSignInfo", "info", col_info)
  hl_diag_sign("DiagnosticSignHint", "hint", col_hint)
  hl_diag_sign("DiagnosticSignOk", "ok", col_ok)

  ---------------------------------------------------------------------------
  -- DIAGNOSTIC TAGS (Neovim 0.10+)
  ---------------------------------------------------------------------------

  -- Unnecessary
  hl("DiagnosticUnnecessary", {
    fg = s.syn.comment or s.ui.fg_dim,
    italic = true,
  })

  -- Deprecated
  hl("DiagnosticDeprecated", {
    fg = col_warn,
    strikethrough = true,
  })

  ---------------------------------------------------------------------------
  -- LEGACY LspDiagnostics* COMPATIBILITY
  ---------------------------------------------------------------------------
  hl("LspDiagnosticsDefaultError", { link = "DiagnosticError" })
  hl("LspDiagnosticsDefaultWarning", { link = "DiagnosticWarn" })
  hl("LspDiagnosticsDefaultInformation", { link = "DiagnosticInfo" })
  hl("LspDiagnosticsDefaultHint", { link = "DiagnosticHint" })

  hl("LspDiagnosticsVirtualTextError", { link = "DiagnosticVirtualTextError" })
  hl("LspDiagnosticsVirtualTextWarning", { link = "DiagnosticVirtualTextWarn" })
  hl("LspDiagnosticsVirtualTextInformation", { link = "DiagnosticVirtualTextInfo" })
  hl("LspDiagnosticsVirtualTextHint", { link = "DiagnosticVirtualTextHint" })

  hl("LspDiagnosticsUnderlineError", { link = "DiagnosticUnderlineError" })
  hl("LspDiagnosticsUnderlineWarning", { link = "DiagnosticUnderlineWarn" })
  hl("LspDiagnosticsUnderlineInformation", { link = "DiagnosticUnderlineInfo" })
  hl("LspDiagnosticsUnderlineHint", { link = "DiagnosticUnderlineHint" })

  hl("LspDiagnosticsSignError", { link = "DiagnosticSignError" })
  hl("LspDiagnosticsSignWarning", { link = "DiagnosticSignWarn" })
  hl("LspDiagnosticsSignInformation", { link = "DiagnosticSignInfo" })
  hl("LspDiagnosticsSignHint", { link = "DiagnosticSignHint" })
end

return M
