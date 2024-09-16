-- download if not there
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  "folke/which-key.nvim",
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "nvim-treesitter/nvim-treesitter-refactor",
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-lint",
      "stevearc/conform.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
  },
  "https://gitlab.com/schrieveslaach/sonarlint.nvim",
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "petertriho/cmp-git",
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "numToStr/Comment.nvim",
    lazy = false,
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  "nvim-lualine/lualine.nvim",
  "akinsho/bufferline.nvim",
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
  },
  "lewis6991/gitsigns.nvim",
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<leader>x",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
    },
  },
  { "windwp/nvim-autopairs", event = "InsertEnter", config = true },
  "f-person/auto-dark-mode.nvim",
}
