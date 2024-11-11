local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Leader key shortcuts
keymap('n', '<leader>w', ':w<CR>', opts)         -- Save
keymap('n', '<leader>q', ':q<CR>', opts)         -- Quit
keymap('n', '<leader>x', ':x<CR>', opts)         -- Save and quit

-- Split navigation
keymap('n', '<leader>h', '<C-w>h', opts)
keymap('n', '<leader>j', '<C-w>j', opts)
keymap('n', '<leader>k', '<C-w>k', opts)
keymap('n', '<leader>l', '<C-w>l', opts)

-- Telescope
keymap('n', '<leader>ff', ':Telescope find_files<CR>', opts)
keymap('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
keymap('n', '<leader>fb', ':Telescope buffers<CR>', opts)
keymap('n', '<leader>fh', ':Telescope help_tags<CR>', opts)

-- Nvim-tree
keymap('n', '<C-n>', ':NvimTreeToggle<CR>', opts)

