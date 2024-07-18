local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    js = { "prettier" },
    ts = { "prettier" },
    go = { "gofumpt", "golines", "goimports-reviser" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },

  formatters = {
    golines = {
      command = "golines",
      args = { "-m", "80" },
      stdin = true,
    },
  },
}

require("conform").setup(options)
