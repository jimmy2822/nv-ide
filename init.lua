-- Packer
require('plugins')
require("neo-tree").setup()
require('settings')
require('settings.utils')
require('settings.color')
require('settings.font')
require('settings.filetype')
-- Keymap
require('settings.keymap')

-- Elixir
require("elixir").setup({
  cmd = { "/Users/jimmywu/.elixir-ls/release/language_server.sh" },
  dialyzerEnabled = true,
  fetchDeps = false,
  enableTestLenses = false,
  suggestSpecs = false,
})
