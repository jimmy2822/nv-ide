require("ibl").setup({
  enabled = true,
  scope = {
    show_start = true,  -- underline first line
    show_end = false
  },
  exclude = {
    buftypes = {'terminal'},
    filetypes = {'help', 'startify', 'alpha', 'dashboard', 'packer', 'neogitstatus', 'NvimTree'},
  },
  indent = { char = '▏' },
})
