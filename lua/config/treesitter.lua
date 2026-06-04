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
  'haskell', 'hcl', 'html',
  'javascript', 'json',
  'lua', 'luadoc', 'luap',
  'make', 'markdown', 'markdown_inline',
  'objc', 'ocaml', 'odin',
  'passwd', 'php', 'python',
  'ruby', 'rst', 'rust',
  'ssh_config', 'svelte',
  'terraform', 'toml', 'typescript',
  'xml',
  'yaml',
  'zig',
}

ts.install(languages)

-- https://github.com/neovim/neovim/discussions/38037
local grp = vim.api.nvim_create_augroup("TreeSitterConfig", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = grp,
  callback = function(evt)
    if vim.list_contains(ts.get_installed(), vim.treesitter.language.get_lang(evt.match)) then
      vim.treesitter.start(evt.buf)
    end
  end,
})
