return {
  --
  -- todo-comments
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup({
        highlight = {
          multiline = false,
          -- allow pattern to include assignee e.g. "TODO(rtb):"
          pattern = [[.*<((KEYWORDS)\s*%(\(.{-1,}\))?)s*:]],
        },
        search = {
          -- allow pattern to include assignee e.g. "TODO(rtb):"
          pattern = [[\b(KEYWORDS)\s*(\(\w*\))?\s*:]],
        }
      })
    end,
  },

  --
  -- Scrollbar
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup()
    end
  },

  --
  -- gitsigns
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
      -- require("scrollbar.handlers.gitsigns").setup()
    end
  },

  --
  -- Which Key
  {
    "folke/which-key.nvim",
    config = function()
      local wk = require("which-key")
      wk.add({
        { "<leader>b",  group = "Buffer" },
        { "<leader>f",  group = "File" },
        { "<leader>g",  group = "git" },
        { "<leader>.",  group = "Floating" },
        { "<leader>gs", group = "Stage" },
        { "<leader>l",  group = "LSP" },
        { "<leader>r",  group = "Refactor" },
        { "<leader>s",  group = "Shunt" },
        { "<leader>x",  group = "Diagnostics" },
      })
    end
  },

  --
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    opts = {
      pickers = {
        buffers = {
          ignore_current_buffer = true,
          sort_lastused = true,
        },
      },
    }
  },

  --
  -- Snacks
  {
    "folke/snacks.nvim",
    opts = {
      styles = {
        input = {
          relative = "cursor",
          width = 50
        }
      },

      -- indent guides
      indent = {
        enabled = true,
        indent = {
          char = "▎",
        },
        animate = {
          enabled = false,
        },
        scope = {
          enabled = false,
        },
      },
      -- gitbrowse - open buffer's git repo in browser
      gitbrowse = {},
      input = {}
    }
  },
}
