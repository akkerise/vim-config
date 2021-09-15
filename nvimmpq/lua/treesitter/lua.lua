local ts_config = require("nvim-treesitter.configs")
ts_config.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    use_languagetree = true,
    disable = {},  -- list of language that will be disabled
  },
  context_commentstring = {
    enable = true
  }
}

