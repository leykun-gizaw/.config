--
-------------------------------------------------------------------------------------
-- Require `lspconfig` & `cmp_nvim_lsp` in protected call
local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local cmp_lsp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_lsp_status_ok then
	return
end

require("user.lsp.mason")
--
-------------------------------------------------------------------------------------
--
-- Signs to use for diagnostics visuals
local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}
-- Assign each sign to corresponding diagnostics
for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name,{ texthl = sign.name, text = sign.text, numhl="" })
end
--
-------------------------------------------------------------------------------------
--
-- Diagnostics configs
local configs = {
	virtual_text = false,
	float = {
		focusable = false,
	},
}
-- Attach configs to diagnostic config
vim.diagnostic.config(configs)
-- Solve border issue on hover
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})
--
-------------------------------------------------------------------------------------
--
-- On attach function that sets up key mappings
local on_attach = function(client, bufnr)
	--
	-- Wrapper function for the exposed api
	--
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	-- Options to pass for each keymap
	local opts = { noremap = true, silent = true }
	-- Keymaps
	buf_set_keymap("n", "gD", "<cmd> lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<cmd> lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd> lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd> lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap(
		"n",
		"gl",
		'<cmd> lua vim.diagnostic.open_float({ border = "rounded" })<CR>', opts
	)
end
-- Extendable capabilities to setup each server
local capabilities = vim.lsp.protocol.make_client_capabilities()
--
-------------------------------------------------------------------------------------
--
local servers = { "pyright", "clangd" }
-- Setup each server with custom `on_attach` and `capabilities` functions
for _, ls in ipairs(servers) do
	lspconfig[ls].setup {
		on_attach = on_attach,
		capabilities = cmp_nvim_lsp.default_capabilities(capabilities),
	}
end
