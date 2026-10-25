local S = require("config.settings")

return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    cond = S.lsp.completion.blink,
    dependencies = {
      "rafamadriz/friendly-snippets"
    },

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'default'
      },

      appearance = {
        nerd_font_variant = 'mono'
      },

      completion = {
        -- documentation = {
        --   auto_show = true,
        --   auto_show_delay_ms = 1000,
        -- },
      },

      signature = {
        enabled = true,
        trigger = {
          -- show automatically
          enabled = true,
        },
      },

      sources = {
        default = { 'lsp', 'snippets' },
      },
    },
  }
}
