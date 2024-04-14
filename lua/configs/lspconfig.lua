local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local coq = require "coq"

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "css_variables",
  "cssmodules_ls",
  "tsserver",
  "omnisharp",
  "tailwindcss",
  "dockerls",
  "docker_compose_language_service",
  "terraformls",
  "rnix",
  "marksman",
  "hls",
  "lua_ls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup(coq.lsp_ensure_capabilities {
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

lspconfig["omnisharp"].setup(coq.lsp_ensure_capabilities {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "omnisharp", "--languageserver" },
})

-- custom config for eslint
lspconfig["eslint"].setup(coq.lsp_ensure_capabilities {
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
})
