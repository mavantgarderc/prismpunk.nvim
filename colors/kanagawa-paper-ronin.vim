if exists('g:colors_name')
  hi clear
endif

if exists('syntax_on')
  syntax reset
endif

let g:colors_name = "kanagawa/paper-ronin"

lua << EOF
local ok, prismpunk = pcall(require, "prismpunk")
if ok and prismpunk.load_colorscheme then
  local success, err = prismpunk.load_colorscheme("kanagawa/paper-ronin")
  if not success then
    vim.notify("[prismpunk] Failed to load kanagawa/paper-ronin: " .. tostring(err), vim.log.levels.ERROR)
  end
else
  vim.notify("[prismpunk] Plugin not loaded", vim.log.levels.ERROR)
end
EOF
