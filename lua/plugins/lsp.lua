return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"

      vim.diagnostic.config {
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        },
        severity_sort = true,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
      }
    end,
  },
  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev stuff
        "css-lsp",
        "css-variables-language-server",
        "cssmodules-language-server",
        "html-lsp",
        "typescript-language-server",
        "deno",
        "prettier",
        "json-lsp",
        "eslint-lsp",
        "tailwindcss-language-server",
        "rustywind",

        -- shell stuff
        "shfmt",

        -- development
        "azure-pipelines-language-server",
        "omnisharp",
        "netcoredbg",
        "csharpier",
        "dockerfile-language-server",
        "docker-compose-language-service",
        "terraform-lsp",
        "marksman",
        "markdownlint",
        "rnix-lsp",
        "tree-sitter-cli",
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require "null-ls"
      opts.sources = opts.sources or {}

      nls.setup {
        sources = {
          nls.builtins.code_actions.gitrebase,
          nls.builtins.code_actions.gitsigns,
          nls.builtins.code_actions.refactoring,
          nls.builtins.formatting.nixpkgs_fmt,
          nls.builtins.formatting.gofmt,
          nls.builtins.formatting.goimports,
          nls.builtins.formatting.prettier,
          nls.builtins.formatting.stylua,
          nls.builtins.diagnostics.markdownlint,
          nls.builtins.formatting.terraform_fmt,
          nls.builtins.diagnostics.terraform_validate,
        },
      }
    end,
  },
}
