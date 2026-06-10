return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      c = { "clang-format" },
      cpp = { "clang-format" },
      go = { "gofmt" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      lua = { "stylua" },
      python = { "isort", "black" },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },

    -- Customise individual formatters here
    formatters = {
      shfmt = {
        append_args = { "-i", "2" },
      },
    },
  },

  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
