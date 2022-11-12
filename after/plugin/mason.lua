local mason_ok, mason = pcall(require, "mason")
if (not mason_ok) then return end

local lsp_ok, lspconfig = pcall(require, "mason-lspconfig")
if (not lsp_ok) then return end

mason.setup({})

lspconfig.setup {
  automatic_installation = true
}
