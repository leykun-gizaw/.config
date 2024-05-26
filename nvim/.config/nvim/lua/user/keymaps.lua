--
-----------------------------------------------
--
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten exposed API method
local keymap = vim.api.nvim_set_keymap
--
-----------------------------------------------
--
-- Use SPACE as the leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
--
-----------------------------------------------
--
-- NORMAL MODE --
keymap("n", "<A-l>", "<C-W><C-l>", opts)
keymap("n", "<A-h>", "<C-W><C-h>", opts)
keymap("n", "<A-k>", "<C-W><C-k>", opts)
keymap("n", "<A-j>", "<C-W><C-j>", opts)
keymap("n", "<S-n>", ":bn<CR>", opts)
keymap("n", "<S-p>", ":bp<CR>", opts)
-- keymap("n", "<leader>e", ":Lex 25<CR>", opts) -- If NvimTree doesn't exist
keymap("n", "<leader>e", ":NvimTreeToggle <CR>", opts)
keymap("n", ":", "<cmd>FineCmdline<CR>", opts)
--
-- End OF NORMAL MODE --
--
-----------------------------------------------
--
-- INSERT MODE --
keymap("i", "jk", "<esc>", opts)
-- End OF INSERT MODE --
--
-----------------------------------------------
--
-- VISUAL MODE --
-- -- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- End OF VISUAL MODE --
--
-----------------------------------------------
--
-- VISUAL BLOCK MODE --
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- END OF VISUAL BLOCK MODE --
--
-----------------------------------------------
--
