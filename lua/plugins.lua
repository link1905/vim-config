return {
    {
        "chrisgrieser/nvim-spider",
        lazy = true,
        keys = {
            { "W", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
            { "E", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
            { "B", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
        },
        config = function()
            require("spider").setup({
                skipInsignificantPunctuation = true,
                consistentOperatorPending = true,
                subwordMovement = true,
            })
        end,
    },
    {
        "kylechui/nvim-surround",
        version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    {
        'jinh0/eyeliner.nvim',
        config = function()
            require('eyeliner').setup({
                highlight_on_key = true,
                dim = true,
                default_keymaps = true,
            })
            vim.api.nvim_set_hl(0, 'EyelinerPrimary', { fg='#c6a0f6', bold = true, underline = true })
            vim.api.nvim_set_hl(0, 'EyelinerSecondary', { fg='#8aadf4', underline = true })
        end
    }
}