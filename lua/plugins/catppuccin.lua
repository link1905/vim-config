return {
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000,
    config = function()
        -- Colorscheme
        require("catppuccin").setup({
            flavour = "mocha",
            integrations = {
                telescope = {
                    enabled = true
                }
            }
        })
        vim.cmd.colorscheme "catppuccin"
    end
}
