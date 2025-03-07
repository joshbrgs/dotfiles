return {
    {
        'epwalsh/obsidian.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("obsidian").setup({
                workspaces = {
                    { name = "Obsidian", path = "~/projects/Obsidian/" },
                },
                notes_subdir = "inbox",
                new_notes_location = "notes_subdir",
                disable_frontmatter = true,
                templates = {
                    subdir = "templates",
                    date_format = "%Y-%m-%d",
                    time_format = "%H:%M:%S",
                },
                mappings = {
                    -- Override 'gf' mapping for markdown/wiki links
                    ["gf"] = {
                        action = function()
                            return require("obsidian").util.gf_passthrough()
                        end,
                        opts = { noremap = false, expr = true, buffer = true },
                    },
                    -- Toggle check-boxes
                    ["<leader>ch"] = {
                        action = function()
                            return require("obsidian").util.toggle_checkbox()
                        end,
                        opts = { buffer = true },
                    },
                },
                completion = {
                    -- nvim_cmp = true, -- Enable nvim-cmp for Obsidian note completion
                    min_chars = 2,
                },
            })
        end,
    }
}
