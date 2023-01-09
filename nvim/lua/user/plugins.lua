--
-- File name
local fn = vim.fn
--
----------------------------------------------------------------
--
-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and repoen Neovim ..."
	vim.cmd [[packadd packer.nvim]]
end
--
----------------------------------------------------------------
--
-- Autocommand that reloads neovim whenever this file is saved
vim.cmd [[
	augroup packer_user_config
	  autocmd!
	  autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]
--
----------------------------------------------------------------
--
-- Use a protected call when requiring packer
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end
--
----------------------------------------------------------------
--
-- Have packer use a pop-up window instead of split
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}
--
----------------------------------------------------------------
--
-- PLUGINS INSTALLATION AREA
--
return packer.startup(function(use)
	-- ADD PLUGIN REPOS HERE --
	use "wbthomason/packer.nvim"
	use "nvim-lua/plenary.nvim"
	use "nvim-lua/popup.nvim"
	-- END OF PLUGIN REPOS --
	--
	-- -- COLORSCHEMES AND THEMES -- --
	-- -- END OF COLORSCHEMES AND THEMES -- --
	--
	-- AUTO SETUP OF CONFIG AFTER PACKER CLONE --
	-- (always keep at the end after plugins) --
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
	-- END OF AUTO SETUP OF CONFIG --
end)
--
----------------------------------------------------------------
--
