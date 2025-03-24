-- Remap leader key
-- Diagnostic keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

-- Make line numbers default
vim.opt.number = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = ''

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
vim.opt.confirm = true

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Remap movement keys
-- Map j to left, k to up, l to down, ; to right
vim.keymap.set({'n', 'v'}, 'j', 'h')
vim.keymap.set({'n', 'v'}, 'k', 'k')
vim.keymap.set({'n', 'v'}, 'l', 'j')
vim.keymap.set({'n', 'v'}, ';', 'l')

-- Scrolling up/down
vim.keymap.set({'n', 'v'}, '<C-k>', '<C-y>')
vim.keymap.set({'n', 'v'}, '<C-y>', '<Nop>')

vim.keymap.set({'n', 'v'}, 'K', '<C-u>')
vim.keymap.set({'n', 'v'}, '<C-u>', '<Nop>')

vim.keymap.set({'n', 'v'}, '<C-l>', '<C-e>')
vim.keymap.set({'n', 'v'}, '<C-e>', '<Nop>')

vim.keymap.set({'n', 'v'}, 'L', '<C-d>')

-- Duplicate line in the next line
vim.keymap.set('n', '<C-d>', ':copy .<CR>')

-- Moving lines up and down
-- Move line up with Alt-k
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==')
vim.keymap.set('i', '<A-k>', '<Esc>:m .-2<CR>==gi')
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv")

-- Move line down with Alt-l
vim.keymap.set('n', '<A-l>', ':m .+1<CR>==')
vim.keymap.set('i', '<A-l>', '<Esc>:m .+1<CR>==gi')
vim.keymap.set('v', '<A-l>', ":m '>+1<CR>gv=gv")

-- Disable
vim.keymap.set('', '<C-q>', '<Nop>')

-- Disable arrow keys in normal mode
vim.keymap.set({'n', 'v', 'i'}, '<Up>', '<Nop>')
vim.keymap.set({'n', 'v', 'i'}, '<Down>', '<Nop>')
vim.keymap.set({'n', 'v', 'i'}, '<Left>', '<Nop>')
vim.keymap.set({'n', 'v', 'i'}, '<Right>', '<Nop>')
vim.keymap.set({'n', 'v'}, '<BS>', '<Nop>')

-- Occurrence of character in line
vim.keymap.set({'n', 'v'}, "'", ';')
vim.keymap.set({'n', 'v'}, '"', ',')

-- Paste without overwriting
vim.keymap.set('v', 'p', 'P')

-- Redo
vim.keymap.set('n', 'U', '<C-r>')
vim.keymap.set('n', '<C-r>', '<Nop>')

-- Better indent
vim.keymap.set('v', '<', '<<')
vim.keymap.set('v', '>', '>>')

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
      vim.highlight.on_yank()
    end,
})


-- Install `lazy.nvim` plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    { 'tpope/vim-sleuth' },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        },
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 
            'nvim-lua/plenary.nvim',
            { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font }
        }
    },
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }
}

require("lazy").setup(plugins)

-- Colorscheme
require("catppuccin").setup({
    flavour = "mocha",
    integrations = {
        telescope = {
            enabled = true
        }
    }
})

-- Setup telescope actions
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["j"] = false,
        ["k"] = actions.move_selection_previous, -- Up
        ["l"] = actions.move_selection_next,     -- Down
        ["<C-k>"] = actions.preview_scrolling_up,
        ["<C-l>"] = actions.preview_scrolling_down,
      },
      i = {
        ["<C-k>"] = actions.preview_scrolling_up,
        ["<C-l>"] = actions.preview_scrolling_down,
      },
    },
  }
}
-- Telescope search functions
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>f', builtin.builtin, { desc = '[F] Select Telescope' } )
vim.keymap.set('n', '<C-g>', function()
    builtin.live_grep {
        prompt_title = 'Find text in files',
    }
end)
vim.keymap.set('n', '<C-f>', builtin.find_files, { desc = "Find files" })

-- Tree sitter config
local config = require('nvim-treesitter.configs')
config.setup({
    ensure_installed = { "lua", "markdown", "markdown_inline", "json", "html", "css", "go" },
    highlight = { enabled = true },
    indent = { enabled  = true }
})

-- Neo-tree
vim.keymap.set('n', '<leader>n', ':Neotree filesystem reveal left')

vim.cmd.colorscheme "catppuccin"
