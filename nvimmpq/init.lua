-- Based on https://github.com/siduck76/neovim-dots

require "plugins.lua"
require "fileIcons.lua"
require "utils.lua"
-- require "bufferline.lua"
require "statusline.lua"

require("colorizer").setup()

-- lsp
require "lspconfig.lua"
require "lspsaga.lua"
-- require "compe.lua"

local cmd = vim.cmd
local g = vim.g
local api = vim.api

g.mapleader = " "
g.auto_save = 1
g.inccommand = "nosplit"

-- Coc
require "coc.lua"

-- colorscheme related stuff

cmd "syntax enable"
cmd "syntax on"

local base16 = require "base16"
base16(base16.themes["onedark"], true)

-- blankline
require "indent.lua"

require "treesitter.lua"
require "mappings.lua"

-- highlights --
cmd "hi LineNr guifg=#383c44 guibg=NONE"
cmd "hi Comment guifg=#3d4149"
cmd "hi SignColumn guibg=NONE"
cmd "hi VertSplit guibg=NONE guifg=#2a2e36"
cmd "hi EndOfBuffer guifg=#1e222a"
cmd "hi PmenuSel guibg=#98c379"
cmd "hi Pmenu  guibg=#282c34"

-- telescope stuff and popupmenu
require "telescope.lua"

require "nvimTree.lua"

-- git signs
require "gitsigns.lua"

require "nvim-autopairs".setup()

--require "lspkind".init(
--    {
--        with_text = true,
--        symbol_map = {
--            Folder = ""
--        }
--    }
--)

-- Terminal behaviors
vim.api.nvim_exec([[
   au BufEnter term://* setlocal nonumber
   au TermOpen * setlocal listchars= nonumber nowrap winfixwidth laststatus=0 noruler signcolumn=no noshowmode
   au TermOpen * startinsert
   au TermClose * set laststatus=2 showmode ruler
]], false)

-- inactive statuslines as thin splitlines
cmd("highlight! StatusLineNC gui=underline guibg=NONE guifg=#383c44")

-- Lazygit
vim.g.lazygit_use_neovim_remote = 0
vim.g.lazygit_floating_window_use_plenary = 0

-- Dart
vim.g.dart_style_guide = 2
vim.g.dart_format_on_save = 1

-- Emmet
vim.g.user_emmet_leader_key="<C-Z>"
