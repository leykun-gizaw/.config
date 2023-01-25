local ts_status, treesitter = pcall(require, "nvim-treesitter")
if not ts_status then
	return
end

local config_status, trs_config = pcall(require, "nvim-treesitter.configs")
if not config_status then
	return
end

trs_config.setup {
	ensure_installed = { "c", "lua", "help", "python" },
	highlight = {
		enable = true,
	},
}
