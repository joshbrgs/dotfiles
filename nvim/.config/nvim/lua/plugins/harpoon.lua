return { {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        -- Initialize Harpoon
        local harpoon = require("harpoon")
        harpoon.setup()

        -- Key mappings for Harpoon
        vim.keymap.set("n", "<leader>a", function() harpoon.mark.add_file() end, { desc = "Harpoon Add File" })
        vim.keymap.set("n", "<C-e>", function() harpoon.ui.toggle_quick_menu() end, { desc = "Harpoon Quick Menu" })

        -- Quick access to specific Harpoon marks
        vim.keymap.set("n", "<leader>1", function() harpoon.ui.nav_file(1) end, { desc = "Harpoon File 1" })
        vim.keymap.set("n", "<leader>2", function() harpoon.ui.nav_file(2) end, { desc = "Harpoon File 2" })
        vim.keymap.set("n", "<leader>3", function() harpoon.ui.nav_file(3) end, { desc = "Harpoon File 3" })
        vim.keymap.set("n", "<leader>4", function() harpoon.ui.nav_file(4) end, { desc = "Harpoon File 4" })

        -- Navigate previous and next buffers within Harpoon list
        vim.keymap.set("n", "<C-S-P>", function() harpoon.nav.prev() end, { desc = "Harpoon Previous Buffer" })
        vim.keymap.set("n", "<C-S-N>", function() harpoon.nav.next() end, { desc = "Harpoon Next Buffer" })
    end
}

}
