local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end
-- vim.cmd [[packadd packer.nvim]]
-- local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

-- using { } when using a different branch of the plugin or loading the plugin with certain commands
return require("packer").startup(
    function()
        use {"wbthomason/packer.nvim", opt = true}
        use {"lukas-reineke/indent-blankline.nvim"}

        use "norcalli/nvim-base16.lua"
        use "kyazdani42/nvim-web-devicons"
        use "kyazdani42/nvim-tree.lua"
        use "nvim-lua/plenary.nvim"
        use "lewis6991/gitsigns.nvim"
        use "akinsho/nvim-bufferline.lua"
        use "glepnir/galaxyline.nvim"
        -- use "907th/vim-auto-save"
        use "nvim-treesitter/nvim-treesitter"
        use "norcalli/nvim-colorizer.lua"
        use "sbdchd/neoformat"
        use {"neoclide/coc.nvim", branch = "release"}
        use "neovim/nvim-lspconfig"
        use "glepnir/lspsaga.nvim"
        -- use "hrsh7th/nvim-compe"
        use "windwp/nvim-autopairs"
        use "alvan/vim-closetag"
        -- use "onsails/lspkind-nvim"
        use "nvim-telescope/telescope.nvim"
        use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
        -- use "nvim-telescope/telescope-media-files.nvim"
        use {"JoosepAlviste/nvim-ts-context-commentstring", branch = "main"}
        use "nvim-lua/popup.nvim"
        -- use "karb94/neoscroll.nvim"
        use "tpope/vim-surround"
        use "tpope/vim-commentary"
        -- use "Raimondi/delimitMate"
        use "tpope/vim-fugitive"
        use "kdheepak/lazygit.nvim"
        use "christoomey/vim-tmux-navigator"
        use {"heavenshell/vim-jsdoc", ['for'] = {'javascript', 'javascript.jsx','typescript'}, ['do'] = 'make install'}

        use "dart-lang/dart-vim-plugin"

        use "mattn/emmet-vim"
        
    end
)
