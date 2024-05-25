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
	use "lunarvim/colorschemes"
	use "loctvl842/monokai-pro.nvim"
	use "Shatur/neovim-ayu"
	-- use "shatur/neovim-ayu"
	-- -- END OF COLORSCHEMES AND THEMES -- --
	--
	-- -- COMPLETION PLUGINS -- --
	use "hrsh7th/nvim-cmp"				-- THE Completion Plugin
	use "hrsh7th/cmp-buffer"			-- Buffer completions
	use "hrsh7th/cmp-path"				-- Path completions
	use "hrsh7th/cmp-cmdline"			-- CMDline completions
	use "saadparwaiz1/cmp_luasnip"			-- Snippet completions
	use "hrsh7th/cmp-nvim-lsp"			-- Source for neovim's built-in LSP
	-- -- END OF COMPLETION PLUGINS -- --
	--
	-- -- SNIPPETS -- --
	use "L3MON4D3/LuaSnip"				-- Snippet engine
	use "rafamadriz/friendly-snippets"		-- Bunch of snippets to use
	-- -- END OF SNIPPETS -- --
	--
	-- -- FILE EXPLORER -- --
	use "kyazdani42/nvim-web-devicons"		-- Icons for NvimTree
	use "kyazdani42/nvim-tree.lua"			-- Tree Plugin
	-- -- END OF FILE EXPLORER -- --
	--
	-- -- SYNTAX HIGHLIGHTING PLUGIN -- --
	use "nvim-treesitter/nvim-treesitter"		-- Treesitter wrapper for neovim
	-- -- END OF SYNTAX HIGHLIGHTING PLUGIN -- --
	--
	-- -- TERMINAL PLUGIN -- --
	use "akinsho/toggleterm.nvim"			-- ToggleTerm terminal plugin
	-- -- END OF TERMINAL PLUGIN -- --
	--
	-- -- LSP PLUGINS -- --
	use "neovim/nvim-lspconfig"			-- Configs for Nvim LSP client
	use "williamboman/mason.nvim"			-- Package manager for Language Servers
	-- -- END OF LSP PLUGINS -- --
	--
	-- -- AUTOPAIR PLUGIN -- --
	use "windwp/nvim-autopairs"			-- Automatic pair creating plugin
	-- -- END OF AUTOPAIR PLUGIN -- --
	--
	-- -- GIT PLUGINS -- --
	use "lewis6991/gitsigns.nvim"			-- Fast git decorating plugin
	-- -- END OF GIT PLUGINS -- --
	--
	-- -- STATUSLINE & BUFFERLINE PLUGINS -- --
	use 'nvim-lualine/lualine.nvim'			-- Minimal statusline plugin
	use "noib3/nvim-cokeline"			-- Extensive bufferline plugin
	-- -- END OF STATUSLINE & BUFFERLINE PLUGINS -- --
	--
	-- -- INDENT GUIDES PLUGIN -- --
	use "lukas-reineke/indent-blankline.nvim"	-- Guides plugin
	-- -- END OF INDENT GUIDES PLUGIN -- --
	--
	-- -- RIPGREP PLUGIN -- --
	use "BurntSushi/ripgrep"			-- Suggested for telescope
	-- -- END OF RIPGREP PLUGIN -- --
	--
	-- -- TELESCOPE PLUGIN -- --
	use {							-- Fuzzy finder plugin
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',	--
	  requires = {						--
		  {'nvim-lua/plenary.nvim'}			--
	  }							--
	}							--
	-- -- END OF TELESCOPE PLUGIN -- --
	--
	-- -- FINE CMDLINE -- --
	use {
	  'VonHeikemen/fine-cmdline.nvim',
	  requires = {
		{'MunifTanjim/nui.nvim'}
	    }
	  }
	--
	-- -- END OF FINE CMDLINE -- --
	--
	-- -- CODE FORMATTER -- --
	use "stevearc/conform.nvim"
	-- -- END OF CODE FORMATTER -- --
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
