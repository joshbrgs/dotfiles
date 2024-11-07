return { {
    'nvim-telescope/telescope.nvim',
    version = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')

        -- Set up key mappings
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

        -- Telescope setup
        telescope.setup({
            defaults = {
                file_ignore_patterns = { "node_modules", ".git" },
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
            },
        })
    end
} }
