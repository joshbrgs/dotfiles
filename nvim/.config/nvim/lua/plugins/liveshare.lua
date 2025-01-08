return { {
    "azratul/live-share.nvim",
    dependencies = {
        "jbyuki/instant.nvim",
    },
    config = function()
        vim.g.instant_username = "joshbrgs"
        require("live-share").setup({
            max_attempts = 20,
            service = "localhost.run"
        })
        vim.keymap.set("n", "<leader>ls", "<CMD>:LiveShareServer <CR>", { desc = "Start Live Share" })
    end
} }
