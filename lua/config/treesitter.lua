local ts = require('nvim-treesitter')

ts.setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}

local languages = {
  'arduino', 'asm', 'awk',
  'bash',
  'c', 'caddy', 'clojure', 'cmake', 'commonlisp', 'cpp', 'c_sharp', 'css', 'csv', 'cuda',
  'd', 'dart', 'devicetree', 'diff', 'dockerfile',
  'elixir', 'elm',
  'go', 'gomod', 'gosum',
  'hcl', 'html',
  'javascript', 'json',
  'lua',
  'make', 'markdown', 'markdown_inline',
  'objc', 'ocaml', 'odin',
  'php', 'python',
  'ruby', 'rust',
  'svelte',
  'terraform', 'toml', 'typescript',
  'xml',
  'yaml',
  'zig',
}

ts.install(languages)

-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = '*',
--   callback = function() pcall(vim.treesitter.start) end,
-- })
