-- Minimal init.lua for testing
vim.opt.runtimepath:append(".")
vim.opt.runtimepath:append("~/.local/share/nvim/site/pack/packer/start/plenary.nvim")

require("plenary.busted")

