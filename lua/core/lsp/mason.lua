local mason_status, mason = pcall(require, "mason")
if not mason_status then
  print("Failed to load mason")
  return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  print("Failed to load mason_lspconfig")
  return
end

mason.setup()

mason_lspconfig.setup({
  ensure_installed = {
    "tsserver",
    "html",
    "cssls",
    "gopls",
    "lua_ls",
    "docker_compose_language_service",
    "dockerls",
    "yamlls",
    "vimls",
    "jsonls"
  }
})
