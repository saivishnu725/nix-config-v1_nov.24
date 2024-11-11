-- Bootstrap packer.nvim if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

-- Plugins
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'                  -- Packer itself
  use 'kyazdani42/nvim-tree.lua'                -- File explorer
  use 'nvim-telescope/telescope.nvim'           -- Fuzzy finder
  use 'nvim-lua/plenary.nvim'                   -- Lua functions for plugins
  use 'nvim-treesitter/nvim-treesitter'         -- Syntax highlighting
  use 'hrsh7th/nvim-cmp'                        -- Auto-completion framework
  use 'hrsh7th/cmp-nvim-lsp'                    -- LSP completion source
  use 'hrsh7th/cmp-buffer'                      -- Buffer completion source
  use 'hrsh7th/cmp-path'                        -- Path completion source
  use 'neovim/nvim-lspconfig'                   -- Language Server Protocol
  use 'numToStr/Comment.nvim'                   -- Easy commenting
  use 'nvim-lualine/lualine.nvim'               -- Statusline
  use 'lewis6991/gitsigns.nvim'                 -- Git integration
  use 'morhetz/gruvbox'                         -- Colorscheme
  use 'akinsho/toggleterm.nvim'                 -- Floating terminal
  use 'windwp/nvim-autopairs'                   -- Auto-pair brackets/quotes
  use 'folke/which-key.nvim'                    -- Keybinding hints
  use 'iamcco/markdown-preview.nvim'            -- Markdown preview
  use 'phaazon/hop.nvim'                        -- Fast navigation
  if packer_bootstrap then
    require('packer').sync()
  end
end)

