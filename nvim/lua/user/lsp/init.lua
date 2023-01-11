--
-------------------------------------------------------------------------------------
-- Require `lspconfig` & `cmp_nvim_lsp` in protected call
local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local cmp_lsp_status_ok, lspconfig = pcall(require, "cmp_nvim_lsp")
if not cmp_lsp_status_ok then
	return
end
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
