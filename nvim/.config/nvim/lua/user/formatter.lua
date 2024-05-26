local conform_status, conform = pcall(require, "conform")
if not conform_status then
	print("conform not found")
	return
end

conform.setup({
	formatters_by_ft = {
		python = { "black" },
	},
	format_on_save = {
		timeout_ms = 1000,
		lsp_fallback = true,
	},
})
