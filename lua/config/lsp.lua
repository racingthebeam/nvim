-- Configuration for native LSP/completion stuff

vim.lsp.enable('gopls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('swift')
vim.lsp.enable('terraform')
vim.lsp.enable('ts')
vim.lsp.enable('zls')

local code_actions_on_save = require("config.settings").code_actions_on_save

-- Check if the given buffer has an LSP capable of formatting the file
-- local function has_formatter(buf)
--   local clients = vim.lsp.get_clients({ bufnr = buf })
--   for _, client in ipairs(clients) do
--     if client.server_capabilities.documentFormattingProvider then
--       return true
--     end
--   end
--   return false
-- end

local code_actions_on_save_group = vim.api.nvim_create_augroup("CodeActionsOnSave", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = code_actions_on_save_group,
  pattern = "*",
  callback = function(ev)
    local ft = vim.bo[ev.buf].filetype

    -- Run configured actions on save
    local actions = code_actions_on_save[ft]
    if actions then
      for _, action in ipairs(actions) do
        local params = vim.lsp.util.make_range_params(0, "utf-8")
        params.context = { only = { action } }
        local result = vim.lsp.buf_request_sync(ev.buf, "textDocument/codeAction", params, 3000)
        for cid, res in pairs(result or {}) do
          for _, r in pairs(res.result or {}) do
            if r.edit then
              local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
              vim.lsp.util.apply_workspace_edit(r.edit, enc)
            end
          end
        end
      end
    end

    -- Format with conform
    -- This will use LSP as a fallback
    require("conform").format({ bufnr = ev.buf, lsp_format = "fallback", timeout_ms = 500 })

    -- -- Finally, if there's no other option - just strip trailing whitespace
    -- -- TODO: this might break Python code?
    -- local save = vim.fn.winsaveview()
    -- vim.cmd([[%s/\s\+$//e]])
    -- vim.fn.winrestview(save)
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  severity_sort = true,
})
