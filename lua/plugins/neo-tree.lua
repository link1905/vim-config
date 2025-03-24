return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    config = function()
        local config = require('nvim-treesitter.configs')
        config.setup({
            ensure_installed = { "lua", "markdown", "markdown_inline", "json", "html", "css", "go" },
            highlight = { enabled = true },
            indent = { enabled  = true }
        })

        -- Neo-tree
        local tree = require('neo-tree');
        tree.setup({
            popup_border_style = "rounded",
            close_if_last_window = false,
            window = {
                mappings = {
                    ["P"] = { "toggle_preview", config = {
                        use_float = true,
                        use_image_nvim = true,
                    } },
                    ["<C-l>"] = { "scroll_preview", config = {direction = -5} },
                    ["<C-k>"] = { "scroll_preview", config = {direction = 5} },
                    ["k"] = "move_up",
                    ["l"] = "move_down",
                    ["j"] = "close_node",
                    [";"] = "open",
                }
            },
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                }
            }
        })

        -- Movement map
        vim.keymap.set({'n', 'v'}, "<leader>q", ":Neotree reveal toggle<CR>", { desc = "Open files tree" })
        vim.keymap.set({'n', 'v'}, "<leader>w", ":Neotree buffers reveal toggle<CR>", { desc = "Open buffers window" })

    end
}
