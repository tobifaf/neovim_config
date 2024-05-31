require("lint").linters_by_ft = {
  lua = { "selene" },
  python = { "flake8" },
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  html = { "markuplint" },
  htmldjango = { "markuplint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
