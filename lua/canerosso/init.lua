require("canerosso.remap")
print("canerossosssss")


--setting di base
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  { "lervag/vimtex" },

  { "SirVer/ultisnips",
    dependencies = { "honza/vim-snippets" }
  },

  { "sstallion/vim-wtf" },

  { "nyoom-engineering/oxocarbon.nvim",
    config = function ()
     vim.cmd.colorscheme "oxocarbon"
    end
  },

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc","cpp","cuda","javascript",
                             "python","php" ,"html","css","typescript","javascript","tsx"},
        highlight =
          {
            enable = true,
            --disable = { "latex" },
          },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<CR>",    -- Premi Invio per iniziare la selezione
            node_incremental = "<CR>",  -- Premi ancora Invio per allargarla
            node_decremental = "<BS>",  -- Premi Backspace per restringerla
          },
        },
      })
    end
  },

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 30,
        },
        filters = {
          dotfiles = false, -- show hidden files
        },
      })
    end,
  },

  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason").setup()

      local servers = { "clangd", "texlab", "lua_ls" }
      require("mason-lspconfig").setup({
        ensure_installed = servers,
      })
    end
  },

  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    dependencies = { "saadparwaiz1/cmp_luasnip" },
    config = function()
      local ls = require("luasnip")
      ls.setup({
        enable_autosnippets = true,
        update_events = "TextChanged,TextChangedI",
      })
      require("luasnip.loaders.from_lua").load({ paths = vim.fn.stdpath("config") .. "/lua/canerosso/snippets/" })
    end,
  },

  -- snippets
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          --tab to navigate through suggestments
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
            else fallback() end
          end, { "i", "s" }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then luasnip.jump(-1)
            else fallback() end
          end, { "i", "s" }),
        }),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
      })
    end
  },
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("transparent").setup({
        extra_groups = {
          "NormalFloat",
          "NvimTreeNormal",
        },
      })
    end
  },
})

