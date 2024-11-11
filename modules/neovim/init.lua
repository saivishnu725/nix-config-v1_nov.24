-- Main Neovim settings
vim.opt.number = true                     -- Show line numbers
vim.opt.relativenumber = true             -- Relative line numbers
vim.opt.tabstop = 2                       -- Number of spaces for a tab
vim.opt.shiftwidth = 2                    -- Spaces for indentation
vim.opt.expandtab = true                  -- Convert tabs to spaces
vim.opt.cursorline = true                 -- Highlight the current line
vim.opt.ignorecase = true                 -- Case-insensitive search
vim.opt.smartcase = true                  -- Override if uppercase used
vim.opt.clipboard = "unnamedplus"         -- Use system clipboard
vim.opt.scrolloff = 8                     -- Keep 8 lines visible above/below cursor
vim.g.mapleader = " "                     -- Space as leader key

-- Load modules
require("plugins")                        -- Plugin setup
require("appearance")                     -- UI settings
require("lsp")                            -- Language Server Protocol configuration
require("keybindings")                    -- Custom keybindings
require("extras")                         -- Additional features

