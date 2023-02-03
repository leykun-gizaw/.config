local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
	return
end

local config_status, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status then
	return
end

nvim_tree.setup {
	auto_reload_on_write = true,
	disable_netrw = true,
	hijack_netrw = true,
	renderer = {
		highlight_git = true,
		icons = {
			webdev_colors = true,
			glyphs = {
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "",
				},
			}
		},
	},
	git = {
		ignore = false,
	}
}
