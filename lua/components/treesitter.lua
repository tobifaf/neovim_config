require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "lua",
    "python",
    "html",
    "htmldjango",
    "javascript",
    "typescript",
    "rust",
    "terraform",
    "yaml",
  },
  refactor = {
    highlight_definitions = {
      enable = true,
      clear_on_cursor_move = true,
    },
  },
  highlight = {
    enable = true,
  },
}
