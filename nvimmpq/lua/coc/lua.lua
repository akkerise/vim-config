local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- local show_documentation = function()
--   call CocAction("")
-- end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        vim.fn.call("coc#_select_confirm", {})
    elseif vim.fn.call("coc#expandableOrJumpable", {}) == 1 then
        return t "<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])<CR>"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn.call("coc#refresh", {})
    end
end

_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    else
        return t "<C-h>"
    end
end

vim.o.completeopt = "menuone,noselect"

-- Plugins
vim.g.coc_global_extensions = {
    'coc-pairs', 
    'coc-tsserver', 
    'coc-prettier', 
    'coc-json', 
    'coc-css', 
    'coc-vetur', 
    'coc-python',
    'coc-flutter'
}

-- Highlight symbol under cursor
vim.api.nvim_exec([[
autocmd CursorHold * silent call CocActionAsync('highlight')
]], false)

-- Mappings
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<C-space>", vim.fn.call("coc#refresh", {}), {silent = true, expr = true})
vim.api.nvim_set_keymap("n", "[e", "<Plug>(coc-diagnostic-prev)", {silent = true})
vim.api.nvim_set_keymap("n", "]e", "<Plug>(coc-diagnostic-next)<Paste>", {silent = true})
vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", {silent = true})
vim.api.nvim_set_keymap("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
vim.api.nvim_set_keymap("n", "gr", "<Plug>(coc-references)", {silent = true})
-- vim.api.nvim_set_keymap("n", "<space>rn", "<Plug>(coc-rename)", {})
-- vim.api.nvim_set_keymap("s", "<space>cf", "<Plug>(coc-format-selected)", {})
-- vim.api.nvim_set_keymap("n", "<space>cv", "<Plug>(coc-codeaction-selected)", {})
-- vim.api.nvim_set_keymap("s", "<space>cv", "<Plug>(coc-codeaction-selected)", {})
vim.api.nvim_set_keymap("n", "<space>cf", "<Plug>(coc-fix-current)", {})
vim.api.nvim_set_keymap("n", "<space>cd", "<Plug>(coc-codeaction)", {})
vim.api.nvim_set_keymap("n", "<space>ba", ":<C-u>CocList diagnostics<CR>", {})
vim.api.nvim_set_keymap("n", "<space>bo", ":<C-u>CocList --number-select outline<CR>", {})
vim.api.nvim_set_keymap("n", "<space>bs", ":<C-u>CocList -I symbols<CR>", {})
vim.api.nvim_set_keymap("n", "<space>bj", ":<C-u>CocNext<CR>", {})
vim.api.nvim_set_keymap("n", "<space>bk", ":<C-u>CocPrev<CR>", {})
vim.api.nvim_set_keymap("n", "<space>y", ":<C-u>CocList -A --normal yank<CR>", {})
vim.api.nvim_set_keymap("n", "K", ":call CocAction('doHover')<CR>", {})
