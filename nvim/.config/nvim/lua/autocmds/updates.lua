vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        local mason_update = require("util.update-mason")
        mason_update.update_all()

        -- Update Lazy.nvim plugins
        require("lazy").sync()
    end,
    desc = "Update Mason and Lazy.nvim plugins on startup",
})

