return { {
    'ray-x/go.nvim',
    dependencies = { 'ray-x/guihua.lua' },
    config = function()
        -- Initialize the go.nvim plugin
        require('go').setup()

        -- Set up format on save for Go files
        local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.go",
            callback = function()
                require('go.format').goimports()     -- Use goimports for formatting
            end,
            group = format_sync_grp,
        })
    end,
}
}
