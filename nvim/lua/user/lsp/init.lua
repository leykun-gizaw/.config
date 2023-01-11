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
