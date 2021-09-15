local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- copy any selected text with pressing y
map("", "<leader>c", '"+y')

-- OPEN TERMINALS --
map("n", "<leader>l<Enter>", [[<Cmd>vnew<CR> term://zsh <CR>]], opt) -- open term over right
map("n", "<leader>j<Enter>", [[<Cmd> split term://zsh | resize 10 <CR>]], opt) -- open term bottom
map("t", "<C-\\><C-\\>", "<C-\\><C-n>:bd!<CR>", opt) -- Close terminal

-- COPY EVERYTHING --
map("n", "<C-a>", [[ <Cmd> %y+<CR>]], opt)

-- Keep search results at the center of screen
map("n", "n", "nzz", opt)
map("n", "N", "Nzz", opt)

-- Splits
-- map("n", "<leader>hn", ":leftabove vnew<CR>", {noremap = true, silent = true})
-- map("n", "<Leader>ln", ":rightbelow vnew<CR>", {noremap = true, silent = true})
-- map("n", "<Leader>kn", ":leftabove  new<CR>", {noremap = true, silent = true})
-- map("n", "<Leader>jn", ":rightbelow new<CR>", {noremap = true, silent = true})

------------- Plugins ---------------

-- Fugitive
map("n", "<leader>gs", ":Gstatus<CR>", {silent = true})
map("n", "<leader>gc", ":Gcommit<CR>", {silent = true})
map("n", "<leader>gb", ":Gblame<CR>", {silent = true})
map("n", "<leader>ge", ":Gedit<CR>", {silent = true})
map("n", "<leader>gE", ":Gedit<space>", {silent = true})
map("n", "<leader>gw", ":Gwrite<CR>", {silent = true})
map("n", "<leader>gW", ":Gwrite!<CR>", {silent = true})
map("n", "<leader>gq", ":Gwq<CR>", {silent = true})
map("n", "<leader>gQ", ":Gwq!<CR>", {silent = true})

-- Lazygit
map("n", "<leader>lg", ":LazyGit<CR>", {})

-- jsdoc
vim.api.nvim_set_keymap("n", "<Leader>d", "<Plug>(jsdoc)", { silent = true })
