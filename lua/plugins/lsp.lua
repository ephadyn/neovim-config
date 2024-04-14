return {
  { "ms-jpq/coq_nvim" },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
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
        "csharpier",
        "dockerfile-language-server",
        "docker-compose-language-service",
        "terraform-lsp",
        "marksman",
        -- "haskell-language-server",
        "rnix-lsp",
        "tree-sitter-cli",
      },
    },
  },
  {
    "rmagatti/goto-preview",
    config = function()
      require("goto-preview").setup {
        width = 120, -- Width of the floating window
        height = 25, -- Height of the floating window
        default_mappings = true, -- Bind default mappings
        debug = false, -- Print debug information
        opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
        -- You can use "default_mappings = true" setup option
        -- Or explicitly set keybindings
        -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
        -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
        -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
      }
    end,
  },
  {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
      },
    },
    opts = { lsp = { auto_attach = true } },
  },
}
