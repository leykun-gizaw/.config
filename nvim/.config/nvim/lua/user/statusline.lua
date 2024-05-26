local lualine_status, lualine = pcall(require, "lualine")
if not lualine_status then
	return
end

lualine.setup {
	options = {
		icons_enabled = true,
		theme = "onedark",
		component_separators = { left = " ▎", right = " ▎" },
		section_separators = { left = "", right = "" },
    		always_divide_middle = true,
    		globalstatus = true,
    		refresh = {
			statusline = 1000,
    		  	tabline = 1000,
    		  	winbar = 1000,
    		}
	},
	sections = {
		lualine_a = {'mode'},
  	  	lualine_b = {'branch', 'diff', 'diagnostics'},
  	  	lualine_c = {'filename'},
  	  	lualine_x = {'encoding', 'fileformat', 'filetype'},
  	  	lualine_y = {'progress'},
  	  	lualine_z = {'location'}
  	},
}
