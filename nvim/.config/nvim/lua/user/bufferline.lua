local buf_status, cokeline = pcall(require, "cokeline")
if not buf_status then
	return
end

cokeline.setup({
	sidebar = {
		filetype = "NvimTree",
		components = {
			{
				text = "  NvimTree",
				fg = "black",
				style = "bold",
			},
		},
	},
})
