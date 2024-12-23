return { {
    'glepnir/lspsaga.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('lspsaga').setup({
            code_action_icon = "💡",
            border_style = "rounded",
            code_action_lightbulb = {
                enable = true,
                sign = true,
                enable_in_insert = false,
                sign_priority = 20,
                virtual_text = true,
            },
            code_action = {
                num_shortcut = true,
                show_server_name = true,
                extend_gitsigns = false,
            },
            ui = {
                border = "rounded",
            },
        })
    end,
} }