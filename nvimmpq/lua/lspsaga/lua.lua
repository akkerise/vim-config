local saga = require 'lspsaga'
saga.init_lsp_saga()

vim.api.nvim_set_keymap("n", "<Leader>fa", [[<Cmd>lua require('lspsaga.codeaction').code_action()<CR>]], {silent = true, noremap = true})
vim.api.nvim_set_keymap("v", "<Leader>fa", ":<C-U>Lspsaga range_code_action<CR>", {silent = true, noremap = true})
