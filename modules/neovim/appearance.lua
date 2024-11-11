-- Colorscheme
vim.cmd("colorscheme gruvbox")
vim.opt.background = "dark"

-- Statusline
require('lualine').setup {
  options = { theme = 'gruvbox' }
}

-- Git signs
require('gitsigns').setup {}

