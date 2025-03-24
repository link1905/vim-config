return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 
        'nvim-lua/plenary.nvim',
        { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font }
    },
    config = function()
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
    end
}
