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
                    ["e"] = { "toggle_preview", config = {
                        use_float = true,
                        use_image_nvim = true,
                    } },
                    ["<C-s>"] = { "scroll_preview", config = {direction = -5} },
                    ["<C-w>"] = { "scroll_preview", config = {direction = 5} },
                    ["w"] = "move_up",
                    ["s"] = "move_down",
                    ["a"] = "close_node",
                    ["d"] = "open",
                    ["i"] = "open_split",
                    ["n"] = {
                        "add",
                        config = {
                            show_path = "relative"
                        }
                    },
                    ["N"] = "add_directory",
                    ["R"] = "rename_basename",
                    ["<C-c>"] = "copy_to_clipboard",
                    ["<C-x>"] = "cut_to_clipboard",
                    ["<C-v>"] = "paste_from_clipboard",
                    ["x"] = "delete",
                }
            },
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
                windows = {
                    mappings = {
                        ["a"] = "navigate_up",
                    },
                    fuzzy_finder_mappings = {
                        ["?"] = "fuzzy_finder_directory",
                        ["<C-w"] = "move_cursor_up",
                        ["C-s"] = "move_cursor_down"
                    }
                }
            }
        })

        -- Movement map
        vim.keymap.set({'n', 'v'}, "<leader>q", ":Neotree reveal toggle<CR>", { desc = "Open files tree" })
        vim.keymap.set({'n', 'v'}, "<leader>w", ":Neotree buffers reveal toggle<CR>", { desc = "Open buffers window" })

    end
}
