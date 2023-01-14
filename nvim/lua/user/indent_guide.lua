local indent_status, indent = pcall(require, "indent_blankline")
if not indent_status then
	return
end

vim.opt.list = true
vim.opt.listchars:append "eol:↴"
vim.opt.listchars:append "space:."

indent.setup {
	show_current_context = true,
}
