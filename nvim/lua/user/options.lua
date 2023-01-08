-- :help options
--
-----------------------------------------------
--
-- Global vim options
local global_options = {
	mouse = 'a',				-- Allow the mouse to be used in neovim
	number = true,				-- Show line number
	textwidth = 79,				-- Set column count to 79 characters
	incsearch = true,			-- Show increamental highlight for searches
	showmode = false, 			-- Stop showing current buffer mode (e.g. -- INSERT -- etc...)
	cursorline = true,			-- Highlight current line where cursor is
	numberwidth = 2,			-- Set number column width to 2 { default: 4 }
	signcolumn = "yes",			-- Always show signcolumn before line numbers
	scrolloff = 8,				-- Cursor position from top or bottom when scrolling
	sidescrolloff = 8,
}
--
--
-- Global vim options
local buffer_options = {
	cindent = true,				-- Smart indentation for C source code files
}
--
--
-- Window vim options
local window_options = {
	wrap = false,				-- Display lines as one long line
}
--
-----------------------------------------------
--
for k, v in pairs(global_options) do
	vim.o[k] = v
end
--
for k, v in pairs(buffer_options) do
	vim.bo[k] = v
end
--
for k, v in pairs(window_options) do
	vim.wo[k] = v
end
--
-----------------------------------------------
--
