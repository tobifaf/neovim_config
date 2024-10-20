require("conform").setup {
  formatters_by_ft = {
    lua = { "stylua" },
    -- python = { "ruff_fix", "ruff_format" },
    python = { "isort", "black" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    htmldjango = { "prettier" },
    -- rust = { "rustfmt" },
    ["*"] = { "trim_whitespace" },
  },
  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 500,
  },
  notify_on_error = true,
}

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format { bufnr = args.buf }
  end,
})
