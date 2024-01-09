-- <F1> help
-- <F2> vim-codepainter
-- <F3> vim-codepainter navigate
vim.keymap.set('n', '<F4>', ':set number! relativenumber!<CR>', {noremap = true, silent = false})
vim.keymap.set('n', '<F5>', ':set list! list?<CR>', {noremap = false, silent = false})
vim.keymap.set('n', '<F6>', '<CMD>lua require("FTerm").toggle()<CR>', { noremap = true, silent = true })
vim.keymap.set('t', '<F6>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<F8>', ':MinimapToggle<CR>', {noremap = false, silent = true})
vim.keymap.set('n', '<leader>nm', ':Dispatch npm start<CR>', {noremap = false, silent = false})
-- Buffers
vim.keymap.set('n', '<S-q>', ':bw<CR>', {noremap = false, silent = false})
vim.keymap.set('n', '<S-l>', ':BufferNext<CR>', {noremap = false, silent = true})
vim.keymap.set('n', '<S-h>', ':BufferPrevious<CR>', {noremap = false, silent = true})
vim.keymap.set('n', '<S-j>', ':BufferMovePrevious<CR>', {noremap = false, silent = true})
vim.keymap.set('n', '<S-k>', ':BufferMoveNext<CR>', {noremap = false, silent = true})
-- Git
vim.keymap.set('n', '<leader>gf', ':20G<CR>', {noremap = false, silent = false})
vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>', {noremap = false, silent = false})
-- Ctrlsf
vim.keymap.set('n', '<C-F>f', '<Plug>CtrlSFPrompt', {noremap = false, silent = false})
vim.keymap.set('v', '<C-F>f', '<Plug>CtrlSFVwordExec', {noremap = false, silent = false})
vim.keymap.set('n', '<C-F>n', '<Plug>CtrlSFCwordExec', {noremap = false, silent = false})
vim.keymap.set('n', '<C-F>t', ':CtrlSFToggle<CR>', {noremap = true, silent = false})
-- Easy-align
vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)', {noremap = false, silent = false})
vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)', {noremap = false, silent = false})
-- Lightspeed
vim.keymap.set('n', 'f', '<Plug>Lightspeed_f', {noremap = false, silent = false})
vim.keymap.set('n', 'F', '<Plug>Lightspeed_F', {noremap = false, silent = false})
vim.keymap.set('n', 't', '<Plug>Lightspeed_t', {noremap = false, silent = false})
vim.keymap.set('n', 'T', '<Plug>Lightspeed_T', {noremap = false, silent = false})
-- Telescope
vim.keymap.set('n', '<leader>r', ":lua require('telescope.builtin').live_grep()<CR>", {noremap = true, silent = true})
vim.keymap.set('n', '<leader>#', ":lua require('telescope.builtin').grep_string()<CR>", {noremap = true, silent = true})
vim.keymap.set('n', '<leader>bb', ":lua require('telescope.builtin').buffers()<CR>", {noremap = true, silent = true})
vim.keymap.set('n', '<leader>t', ":lua require('telescope.builtin').treesitter()<CR>", {noremap = true, silent = true})
vim.keymap.set('n', '<leader>l', ":lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", {noremap = true, silent = true})
vim.keymap.set('n', '<leader>f', ":lua require('plugins.telescope').project_files()<CR>", {noremap = true, silent = true})
vim.keymap.set('n', '<leader>p', ":lua require'telescope'.extensions.repo.list{file_ignore_patterns={'/%.cache/', '/%.cargo/', '/%.local/', '/%.asdf/', '/%.zinit/', '/%.tmux/'}}<CR>", {noremap = true, silent = true})
vim.keymap.set('n', '<leader>c', ":lua require('plugins.telescope').my_git_commits()<CR>", {noremap = true, silent = true})
vim.keymap.set('n', '<leader>g', ":lua require('plugins.telescope').my_git_status()<CR>", {noremap = true, silent = true})
vim.keymap.set('n', '<leader>b', ":lua require('plugins.telescope').my_git_bcommits()<CR>", {noremap = true, silent = true})
vim.keymap.set('n', '<leader>ns', ":lua require('plugins.telescope').my_note()<CR>", {noremap = true, silent = true})
vim.keymap.set('n', '<leader>nn', ":lua NewNote()<CR>", {noremap = true, silent = false})
vim.keymap.set('n', '<leader>n', ":lua require('plugins.scratches').open_scratch_file_floating()<CR>", {noremap = true, silent = true})
vim.keymap.set('n', '<leader>gc', ':Octo issue create<CR>', {noremap = true, silent = false})
-- vim.keymap.set('n', '<leader>i', ':Octo issue list<CR>', {noremap = true, silent = false})
vim.keymap.set('n', '<leader>y', ':Telescope neoclip<CR>', {noremap = true, silent = false})
vim.keymap.set('n', '<leader>ll', ":lua require('telescope.builtin').grep_string({ search = vim.fn.input('GREP -> ') })<CR>", {noremap = true, silent = true})
-- HlsLens
vim.keymap.set('n', 'n', "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>", { noremap = true, silent = true })
vim.keymap.set('n', 'N', "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '*', "*<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
vim.keymap.set('n', '#', "#<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
vim.keymap.set('n', 'g*', "g*<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
vim.keymap.set('n', 'g#', "g#<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
-- Todo-comments
vim.keymap.set('n', '<leader>to', ':TodoTelescope<CR>', {noremap = true, silent = false})
-- Move.nvim
vim.keymap.set('n', '<A-j>', ":MoveLine(1)<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<A-k>', ":MoveLine(-1)<CR>", { noremap = true, silent = true })
vim.keymap.set('v', '<A-j>', ":MoveBlock(1)<CR>", { noremap = true, silent = true })
vim.keymap.set('v', '<A-k>', ":MoveBlock(-1)<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<A-l>', ":MoveHChar(1)<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<A-h>', ":MoveHChar(-1)<CR>", { noremap = true, silent = true })
vim.keymap.set('v', '<A-l>', ":MoveHBlock(1)<CR>", { noremap = true, silent = true })
vim.keymap.set('v', '<A-h>', ":MoveHBlock(-1)<CR>", { noremap = true, silent = true })
-- Trouble
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", {silent = true, noremap = true})
-- Nvim-dap
vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>ds", "<cmd>lua require'dap'.step_over()<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>dsi", "<cmd>lua require'dap'.step_into()<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>dso", "<cmd>lua require'dap'.step_out()<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>dui", ":lua require('dapui').toggle()<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>dro", "<cmd>lua require'dap'.repl.open()<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>dcc", "<cmd>lua require'telescope'.extensions.dap.commands{}<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>dlb", "<cmd>lua require'telescope'.extensions.dap.list_breakpoints{}<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>dv", "<cmd>lua require'telescope'.extensions.dap.variables{}<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>df", "<cmd>lua require'telescope'.extensions.dap.frames{}<CR>", {silent = true, noremap = true})

-- FZF
vim.keymap.set("n", "<C-C>", ":FZF<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<C-c>", ":FZF<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<C-g>", ":Ag<cr>", {silent = true, noremap = true})

-- Better Whitcespace
vim.keymap.set('n', '<C-o>', ':NeoTreeShow<CR>', {noremap = true, silent = false})
