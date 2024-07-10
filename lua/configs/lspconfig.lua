local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "css_variables",
  "cssls",
  "cssmodules_ls",
  "vtsls",
  "omnisharp",
  "tailwindcss",
  "dockerls",
  "docker_compose_language_service",
  "terraformls",
  "rnix",
  "marksman",
  "hls",
  "lua_ls",
  "gopls",
  "graphql",
  "postgres_lsp",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig["omnisharp"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "omnisharp", "--languageserver" },
  handlers = {
    ["textDocument/definition"] = function(...)
      return require("omnisharp_extended").handler(...)
    end,
  },
  keys = {
    {
      "gd",
      function()
        require("omnisharp_extended").telescope_lsp_definitions()
      end,
      desc = "Goto Definition",
    },
  },
  enable_roslyn_analyzers = true,
  organize_imports_on_format = true,
  enable_import_completion = true,
}

lspconfig["jsonls"].setup {
  -- lazy-load schemastore when needed
  on_new_config = function(new_config)
    new_config.settings.json.schemas = new_config.settings.json.schemas or {}
    vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
  end,
  settings = {
    json = {
      format = {
        enable = true,
      },
      validate = { enable = true },
    },
  },
}

-- custom config for eslint
lspconfig["eslint"].setup {
  on_attach = function(client)
    if client.name == "eslint" then
      client.server_capabilities.documentFormattingProvider = true
    elseif client.name == "tsserver" then
      client.server_capabilities.documentFormattingProvider = false
    end
  end,
  capabilities = capabilities,
  settings = {
    format = { enable = true },
  },
  root_dir = lspconfig.util.root_pattern ".git",
  workingDirectory = { mode = "auto" },
}
