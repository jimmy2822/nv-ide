-- vim.cmd [[packadd packer.nvim]]
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "plugins.lua",
  command = "source <afile> | PackerCompile",
})

require('packer').init({display = {auto_clean = false}})

return require('packer').startup(function(use)

  -- Load lua path
  local lua_path = function(name)
    return string.format("require'plugins.%s'", name)
  end

  -- Packer can manage itself as an optional plugin
  use { 'wbthomason/packer.nvim' }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'feline-nvim/feline.nvim', config = lua_path"feline" }
  use { 'lukas-reineke/indent-blankline.nvim', config = lua_path"indent-blankline" }
  use { 'JoosepAlviste/nvim-ts-context-commentstring' }
  use { 'lewis6991/nvim-treesitter-context' }

  -- autocomplete and snippets
  use { "hrsh7th/cmp-vsnip"  }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-path" }
  use { "hrsh7th/vim-vsnip"  }
  use { "hrsh7th/nvim-cmp"   }
  use {
    "fatih/vim-go",
    run = ':GoUpdateBinaries',
    ft = 'go',
    setup = function()
      local t = function(str)
        return vim.api.nvim_replace_termcodes(str, true, true, true)
      end

      local check_back_space = function()
        local col = vim.fn.col('.') - 1
        if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
          return true
        else
          return false
        end
      end

      _G.tab_complete = function()
        if vim.fn.pumvisible() == 1 then
          return t "<C-n>"
        elseif check_back_space() then
          return t "<Tab>"
        else
          return t "<C-x><C-o>"
        end
      end

      _G.s_tab_complete = function()
        if vim.fn.pumvisible() == 1 then
          return t "<C-p>"
        else
          return t "<C-h>"
        end
      end

      _G.enter_key = function()
        if vim.fn.pumvisible() == 1 then
          return t "<C-y>"
        else
          return t "<CR>"
        end
      end
      vim.api.nvim_set_keymap("i", "<tab>", "<C-R>=v:lua.tab_complete()<CR>" ,{silent = true, noremap = true})
      vim.api.nvim_set_keymap("i", "<s-tab>", "<C-R>=v:lua.s_tab_complete()<CR>" ,{silent = true, noremap = true})
      vim.api.nvim_set_keymap('i', '<enter>', '<C-R>=v:lua.enter_key()<CR>' ,{silent = true, noremap = true})
    end
  }

  -- GoLang
  use { 'ray-x/go.nvim' }
  use { 'ray-x/guihua.lua' }
  use
  {
    'preservim/tagbar', cmd = 'TagbarToggle', setup = function()
      vim.g.tagbar_type_go = {
        ctagstype = 'go',
        kinds = {
          'p:package',
          'i:imports:1',
          'c:constants',
          'v:variables',
          't:types',
          'n:interfaces',
          'w:fields',
          'e:embedded',
          'm:methods',
          'r:constructor',
          'f:functions'
        },
        sro = '.',
        kind2scope = {
          t = 'ctype',
          n = 'ntype',
        },
        scope2kind = {
          ctype = 't',
          ntype = 'n'
        },
        ctagsbin  = 'gotags',
        ctagsargs = '-sort -silent'
      }
    end
  }

  -- Syntax
  use { 'chrisbra/csv.vim' }
  use { 'junegunn/vim-easy-align' }
  use { 'mhartington/formatter.nvim', config = lua_path"formatter" }
  use { 'zdharma-continuum/zinit-vim-syntax' }
  use { 'numToStr/Comment.nvim', config = lua_path"comment"}

  -- Icons
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'ryanoasis/vim-devicons' }

  -- Status Line and Bufferline
  use { 'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'} }

  -- Telescope
  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-telescope/telescope.nvim', config = lua_path"telescope" }
  use { 'nvim-telescope/telescope-fzy-native.nvim' }
  use { 'cljoly/telescope-repo.nvim' }
  use { 'nvim-telescope/telescope-dap.nvim' }
  use { 'pwntester/octo.nvim', config = lua_path"octo" }

  -- Explorer
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  -- Color
  use { 'crivotz/nvim-colorizer.lua', config = lua_path"colorizer" }

  -- Git
  use { 'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}, config = lua_path"gitsigns" }
  use { 'kdheepak/lazygit.nvim' }
  use { 'rhysd/committia.vim' }

  -- Registers & clipboard
  use { 'AckslD/nvim-neoclip.lua', config = lua_path"nvim-neoclip" }

  -- Move & Search & replace
  use { 'nacro90/numb.nvim', config = lua_path"numb" }
  use { 'dyng/ctrlsf.vim', config = lua_path"ctrlsf" }
  use { 'kevinhwang91/nvim-hlslens', config = lua_path"hlslens" }
  use { 'ggandor/lightspeed.nvim', config = lua_path"lightspeed" }
  use { 'karb94/neoscroll.nvim', config = lua_path"neoscroll" }
  use { 'dstein64/nvim-scrollview' }
  use { 'chaoren/vim-wordmotion' }
  use { 'fedepujol/move.nvim' }

  -- Tim Pope docet
  use { 'tpope/vim-rails' }
  use { 'tpope/vim-abolish' }
  use { 'tpope/vim-sleuth' }
  use { 'tpope/vim-bundler' }
  use { 'tpope/vim-capslock' }
  use { 'tpope/vim-repeat' }
  use { 'tpope/vim-endwise' }
  use { 'tpope/vim-dispatch' }
  use { 'tpope/vim-dadbod' }
  use { 'tpope/vim-jdaddy' }
  use { 'tpope/vim-fugitive' }

  -- Folke
  use { 'folke/trouble.nvim' }
  use { 'folke/todo-comments.nvim', config = lua_path"todo-comments" }
  use { 'folke/which-key.nvim', config = lua_path"which-key" }

  -- Tmux
  use { 'christoomey/vim-tmux-navigator' }

  -- LSP
  use { 'neovim/nvim-lspconfig' }

  -- Colorschema
  use { 'sainnhe/gruvbox-material' }
  use { 'stevearc/dressing.nvim', config = lua_path"dressing" }

  -- Debugger
  use { 'mfussenegger/nvim-dap', config = lua_path"nvim-dap" }
  use { 'rcarriga/nvim-dap-ui', config = lua_path"nvim-dap-ui" }
  use { 'theHamsta/nvim-dap-virtual-text', config = lua_path"nvim-dap-virtual-text" }

  -- General Plugins
  use { 'machakann/vim-sandwich', config = lua_path"sandwich" }
  use { 'rcarriga/nvim-notify', config = lua_path"nvim-notify" }
  use { 'airblade/vim-rooter', config = lua_path"vim-rooter" }
  use { 'goolord/alpha-nvim', config = lua_path"alpha-nvim" }
  use { 'jeffkreeftmeijer/vim-numbertoggle' }
  use { 'lambdalisue/suda.vim' }
  use { 'numtostr/FTerm.nvim', config = lua_path"fterm" }
  use { 'luukvbaal/stabilize.nvim', config = lua_path"stabilize" }
  use { 'beauwilliams/focus.nvim', config = lua_path"focus" }
  use { 'kevinhwang91/nvim-bqf' }
  use { 'junegunn/fzf' }
  use { 'junegunn/fzf.vim' }
  use { 'ntpeters/vim-better-whitespace' }
end)
