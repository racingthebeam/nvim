return {
  cmd = { 'terraform-ls', 'serve' },
  filetypes = { 'terraform', 'tf' },
  root_markers = { { '.terraform.lock.hcl' }, '.git' },
  settings = {},
}
