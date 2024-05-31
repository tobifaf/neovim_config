-- explorer keymap
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<cr>")

-- file explorer
require("nvim-tree").setup {
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
    custom = { "^.git$", "^.DS_Store$", "^.localized$" },
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
}
