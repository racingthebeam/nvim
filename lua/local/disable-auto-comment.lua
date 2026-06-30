-- local/disable-auto-comment.lua
-- Disable automatic comment continuation on <CR>, o, O for the specified
-- file typs.

vim.api.nvim_create_autocmd("FileType", {
  pattern = '*',
  callback = function()
    vim.opt_local.formatoptions:remove({ 'r', 'o' })
  end,
})
