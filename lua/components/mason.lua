require("mason").setup()

require("mason-lspconfig").setup {
  ensure_installed = {
    "lua_ls",
    "pylsp",
    "ts_ls",
    "terraformls",
    "ansiblels",
    "rust_analyzer",
    "gopls",
  },
}

require("mason-tool-installer").setup {
  ensure_installed = {
    -- formatters
    "stylua", --lua
    "black", --python
    "isort", --python
    "prettier", --JS/TS
    -- linters
    "flake8", --python
    "ruff", --python (also a formatter)
    "selene", --lua
    "eslint_d", --JS/TS
    "ansible-lint", --ansible filetype=yaml.ansible
    "sonarlint-language-server",
    "markuplint", --html
  },
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
    },
  },
  capabilities = capabilities,
}

require("lspconfig").pylsp.setup {
  capabilities = capabilities,
  root_dir = function(fname)
    local root_files = {
      "requirements.txt",
    }
    return require("lspconfig.util").root_pattern(unpack(root_files))(fname)
      or require("lspconfig.util").find_git_ancestor(fname)
      or vim.fn.expand "%:p:h"
  end,
  settings = {
    pylsp = {
      plugins = {
        ruff = {
          enabled = true,
          formatEnabled = true,
        },
        pylsp_mypy = { enabled = true },
        rope_autoimport = {
          enabled = true,
          completions = {
            enabled = true,
          },
          code_action = true,
        },
      },
    },
  },
}

require("lspconfig").ts_ls.setup {
  capabilities = capabilities,
}

require("lspconfig").terraformls.setup {
  capabilities = capabilities,
}

require("lspconfig").ansiblels.setup {
  capabilities = capabilities,
}

require("lspconfig").rust_analyzer.setup {
  capabilities = capabilities,
}

require("lspconfig").gopls.setup {
  capabilities = capabilities,
}

require("sonarlint").setup {
  server = {
    cmd = {
      "sonarlint-language-server",
      "-stdio",
      "-analyzers",
      vim.fn.expand "$MASON/share/sonarlint-analyzers/sonarpython.jar",
    },
  },
  filetypes = {
    "python",
  },
}

vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "ca", vim.lsp.buf.code_action)
