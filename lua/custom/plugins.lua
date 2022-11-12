local fn = vim.fn

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
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float {
        border = "rounded"
      }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- automatic bracket closer
  use "windwp/nvim-autopairs"
  use "windwp/nvim-ts-autotag"

  -- color scheme
  use { "catppuccin/nvim", as = "catppuccin" }

  -- colorizer
  use "norcalli/nvim-colorizer.lua"
  use { 'mrshmllow/document-color.nvim', config = function()
    require("document-color").setup {
      -- Default options
      mode = "background", -- "background" | "foreground" | "single"
    }
  end
  }

  -- Completion + snippet plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-nvim-lsp"
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "lukas-reineke/cmp-under-comparator"
  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/mason.nvim" -- simple to use language server installer
  use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "glepnir/lspsaga.nvim" -- LSP UIs

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  }
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use({
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({})
    end
  })
  use "p00f/nvim-ts-rainbow"

  -- Comments
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "JoosepAlviste/nvim-ts-context-commentstring" -- JSX / TSX aware comments

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Explorer
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"

  -- Bufferline / Tabs
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"

  -- Lualine
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
  }

  -- Which-key
  -- Lua
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        window = {
          border = "single", -- none, single, double, shadow
          position = "bottom", -- bottom, top
          margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
          padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
          winblend = 0
        },
      })
    end
  }

  -- Terminal
  use { "akinsho/toggleterm.nvim" }

  -- Folding
  use {
    "anuvyklack/pretty-fold.nvim",
    config = function()
      require("pretty-fold").setup({})
    end
  }
  use {
    "anuvyklack/fold-preview.nvim",
    requires = "anuvyklack/keymap-amend.nvim",
    config = function()
      require("fold-preview").setup({
        default_keybindings = false,
        border = "single",
      })
    end
  }

  -- Leap
  use {
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end
  }

  -- Indent line
  use "lukas-reineke/indent-blankline.nvim"

  -- Harpoon
  use "ThePrimeagen/harpoon"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
