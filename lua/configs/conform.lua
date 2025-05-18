return {
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    -- You can customize some of the format options for the filetype (:help conform.format)
    rust = { "rustfmt", lsp_format = "fallback" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    vue = { "prettierd", "prettier" },
    javascript = { "prettierd", "prettier" },
    typescript = { "prettierd", "prettier" },
    css = { "prettierd", "prettier" },
    html = { "prettierd", "prettier" },
    -- Conform will run the first available formatter
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}
