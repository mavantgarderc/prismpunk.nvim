local M = {}

local H = require("prismpunk.core.highlights")
local hl = H.hl
local merge = H.merge
local get_style = H.get_style

function M.apply(c, config)
  if not c or not c.ui or not c.syn or not c.diag then
    H.warn("editor.lua: missing color structure (ui/syn/diag)")
    return
  end

  local s = c
  local is_complex = c.is_complex

  local styles = (config and config.styles) or {}
  local cursorline_style = get_style(styles, { "ui", "cursorline" })
  local search_style = get_style(styles, { "ui", "search" })
  local floats_style = get_style(styles, { "ui", "floats" })
  local statusline_style = get_style(styles, { "ui", "statusline" })
  local winbar_style = get_style(styles, { "ui", "winbar" })
  local tabline_style = get_style(styles, { "ui", "tabline" })
  local popup_style = get_style(styles, { "ui", "popup" })

  -- CORE WINDOWS / NORMAL
  ---------------------------------------------------------------------------
  hl("Normal", {
    fg = s.ui.fg,
    bg = s.ui.bg,
    ctermfg = 15,
    ctermbg = 0,
  })

  local float_fg = s.ui.fg
  local float_bg = s.ui.float
  if is_complex and type(s.ui.float) == "table" then
    float_fg = s.ui.float.fg
    float_bg = s.ui.float.bg
  end

  hl("NormalFloat", merge({ fg = float_fg, bg = float_bg }, floats_style))
  hl("NormalNC", { fg = s.ui.fg, bg = s.ui.bg })
  hl("FloatTitle", merge({ fg = float_fg, bg = float_bg, bold = true }, floats_style))
  hl("FloatShadow", merge({ bg = s.ui.bg_dim }, floats_style))
  hl("FloatShadowThrough", merge({ bg = s.ui.bg_dim }, floats_style))

  -- CURSOR / CURSORLINE / TERMINAL CURSOR
  ---------------------------------------------------------------------------
  hl("Cursor", { fg = s.ui.bg, bg = s.ui.fg })
  hl("lCursor", { fg = s.ui.bg, bg = s.ui.fg })
  hl("CursorIM", { fg = s.ui.bg, bg = s.ui.fg })

  hl("TermCursor", { fg = s.ui.bg, bg = s.ui.fg })
  hl("TermCursorNC", { fg = s.ui.bg, bg = s.ui.fg })

  local cursorline_bg = is_complex and s.ui.bg_cursorline or s.ui.cursorline
  hl("CursorLine", merge({ bg = cursorline_bg }, cursorline_style))
  hl("CursorColumn", merge({ bg = cursorline_bg }, cursorline_style))
  hl("ColorColumn", { bg = s.ui.bg_dim })

  -- LINE NUMBERS / SIGNS / FOLDS
  ---------------------------------------------------------------------------
  hl("LineNr", { fg = s.ui.line_nr })
  hl("LineNrAbove", { fg = s.ui.line_nr_dim })
  hl("LineNrBelow", { fg = s.ui.line_nr_dim })
  hl("CursorLineNr", { fg = s.ui.line_nr_active, bold = true })

  hl("SignColumn", { fg = s.ui.line_nr, bg = s.ui.bg })
  hl("CursorLineSign", { fg = s.ui.line_nr_active })
  hl("CursorLineFold", { fg = s.ui.line_nr_active })

  hl("Folded", { fg = s.syn.comment, bg = s.ui.bg_dim })
  hl("FoldColumn", { fg = s.ui.line_nr })

  -- VISUAL / MATCHPAREN / SEARCH
  ---------------------------------------------------------------------------
  hl("Visual", { bg = s.ui.selection })
  hl("VisualNOS", { bg = s.ui.selection })
  hl("MatchParen", { fg = s.syn.special, bg = s.ui.bg_highlight, bold = true })

  hl("Search", merge({ fg = s.ui.bg, bg = s.syn.type }, search_style))
  hl("CurSearch", merge({ fg = s.ui.bg, bg = s.syn.number }, search_style))
  hl("IncSearch", merge({ fg = s.ui.bg, bg = s.syn.number }, search_style))
  hl("Substitute", merge({ fg = s.ui.bg, bg = s.syn.type }, search_style))

  -- SPLITS / BORDERS / FLOATS
  ---------------------------------------------------------------------------
  hl("VertSplit", { fg = s.ui.border })
  local win_sep = (is_complex and s.ui.win_separator) or s.ui.border
  hl("WinSeparator", { fg = win_sep })

  local float_border_fg = s.ui.border
  local float_border_bg = s.ui.float
  if is_complex and type(s.ui.float) == "table" then
    float_border_fg = s.ui.float.fg_border
    float_border_bg = s.ui.float.bg_border
  end
  hl("FloatBorder", merge({ fg = float_border_fg, bg = float_border_bg }, floats_style))

  -- WINBAR / STATUSLINE / MESSAGES
  ---------------------------------------------------------------------------
  hl("WinBar", merge({ fg = s.ui.fg, bg = s.ui.bg_dim }, winbar_style))
  hl("WinBarNC", merge({ fg = s.ui.fg_dim, bg = s.ui.bg_dim }, winbar_style))

  hl("StatusLine", merge({ fg = s.ui.fg_dim, bg = s.ui.bg_dim }, statusline_style))
  hl("StatusLineNC", merge({ fg = s.ui.line_nr, bg = s.ui.bg_dim }, statusline_style))

  hl("ModeMsg", { fg = s.ui.fg })
  hl("MsgArea", { fg = s.ui.fg_dim })
  hl("MsgSeparator", { fg = s.ui.border })
  hl("MoreMsg", { fg = s.syn.type })
  hl("Question", { fg = s.syn.type })

  -- TABLINE
  ---------------------------------------------------------------------------
  if is_complex and type(s.ui.tabline) == "table" then
    hl(
      "TabLine",
      merge({
        fg = s.ui.tabline.fg_inactive,
        bg = s.ui.tabline.bg_inactive,
      }, tabline_style)
    )
    hl("TabLineFill", merge({ bg = s.ui.tabline.bg }, tabline_style))
    hl(
      "TabLineSel",
      merge({
        fg = s.ui.tabline.fg_selected,
        bg = s.ui.tabline.bg_selected,
      }, tabline_style)
    )
  else
    hl("TabLine", merge({ fg = s.ui.fg_dim, bg = s.ui.bg_dim }, tabline_style))
    hl("TabLineFill", merge({ bg = s.ui.bg_dim }, tabline_style))
    hl(
      "TabLineSel",
      merge({
        fg = s.ui.line_nr_active,
        bg = s.ui.bg_highlight,
      }, tabline_style)
    )
  end

  -- POPUPS / MENUS (Pmenu / WildMenu)
  ---------------------------------------------------------------------------
  if is_complex and type(s.ui.pmenu) == "table" then
    hl(
      "Pmenu",
      merge({
        fg = s.ui.pmenu.fg,
        bg = s.ui.pmenu.bg,
      }, popup_style)
    )
    hl(
      "PmenuSel",
      merge({
        fg = s.ui.pmenu.fg_sel,
        bg = s.ui.pmenu.bg_sel,
      }, popup_style)
    )
    hl("PmenuSbar", merge({ bg = s.ui.pmenu.bg_sbar }, popup_style))
    hl("PmenuThumb", merge({ bg = s.ui.pmenu.bg_thumb }, popup_style))
  else
    hl("Pmenu", merge({ fg = s.ui.fg, bg = s.ui.bg_dim }, popup_style))
    hl(
      "PmenuSel",
      merge({
        fg = s.ui.bg,
        bg = s.ui.line_nr_active,
      }, popup_style)
    )
    hl("PmenuSbar", merge({ bg = s.ui.bg_highlight }, popup_style))
    hl("PmenuThumb", merge({ bg = s.ui.fg_dim }, popup_style))
  end

  hl("PmenuKind", { fg = s.syn.type })
  hl("PmenuExtra", { fg = s.syn.comment })
  hl("WildMenu", merge({ fg = s.ui.bg, bg = s.ui.line_nr_active }, popup_style))

  -- MISC UI
  ---------------------------------------------------------------------------
  local nontext = (is_complex and s.ui.nontext) or s.ui.bg_highlight
  hl("NonText", { fg = nontext })
  hl("SpecialKey", { fg = s.ui.nontext or s.ui.bg_highlight })
  hl("EndOfBuffer", { fg = s.ui.bg })
  hl("Directory", { fg = s.syn.type })
  hl("ErrorMsg", { fg = s.diag.error })
  hl("WarningMsg", { fg = s.diag.warning })
  hl("Title", { fg = s.syn.keyword, bold = true })
  hl("Conceal", { fg = s.syn.comment })

  hl("Whitespace", { fg = s.ui.nontext or nontext })
  hl("NormalSB", { fg = s.ui.fg_dim, bg = s.ui.bg_dim })
  hl("SignColumnSB", { fg = s.ui.line_nr, bg = s.ui.bg_dim })

  -- SPELLING
  ---------------------------------------------------------------------------
  hl("SpellBad", { sp = s.diag.error, undercurl = false })
  hl("SpellCap", { sp = s.diag.warning, undercurl = false })
  hl("SpellRare", { sp = s.diag.info, undercurl = true })
  hl("SpellLocal", { sp = s.diag.hint, undercurl = true })

  -- TERMINAL
  ---------------------------------------------------------------------------
  hl("Terminal", { fg = s.ui.fg, bg = s.ui.bg })
  hl("TerminalNormal", { fg = s.ui.fg, bg = s.ui.bg })
  hl("@terminal", { fg = s.ui.fg })

  -- QUICKFIX / LOCATION LIST (Neovim 0.10+)
  ---------------------------------------------------------------------------
  hl("QuickFixLine", {
    fg = s.ui.fg,
    bg = s.ui.bg_highlight,
    bold = true,
  })
  hl("qfFileName", { fg = s.syn.type })
  hl("qfLineNr", { fg = s.ui.line_nr })
  hl("qfSeparator", { fg = s.ui.nontext or s.ui.bg_highlight })
end

return M
