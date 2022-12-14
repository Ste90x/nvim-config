local configs = require("nvim-treesitter.configs")

configs.setup {
  ensure_installed = {
    "astro",
    "css",
    "html",
    "dockerfile",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "lua",
    "prisma",
    "rust",
    "scss",
    "tsx",
    "typescript",
    "vim",
    "yaml",
    "graphql",
  },
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    colors = { "#FFAEBC", "#FBE7C6", "#B4F8C8", "#A0E7E5" }, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  textobjects = {
    lsp_interop = {
      enable = true,
      border = "single",
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",
        ["<leader>dF"] = "@class.outer",
      }
    }
  }
}
