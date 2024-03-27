return {
  {
    "olexsmir/gopher.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    vim.keymap.set("n", "<leader>Gi", ":GoInstallDeps<CR>"),
    vim.keymap.set("n", "<leader>Gj", ":GoTagAdd json<CR>"),
    vim.keymap.set("n", "<leader>GJ", ":GoTagRm json<CR>"),
    vim.keymap.set("n", "<leader>Gy", ":GoTagAdd yaml<CR>"),
    vim.keymap.set("n", "<leader>GY", ":GoTagRm yaml<CR>"),
    vim.keymap.set("n", "<leader>Gg", ":GoMod tidy<CR>"),
    vim.keymap.set("n", "<leader>Gt", ":GoTestAdd<CR>"),
    vim.keymap.set("n", "<leader>GT", ":GoTestAll<CR>"),
    vim.keymap.set("n", "<leader>Gc", ":GoCmt<CR>"),
    vim.keymap.set("n", "<leader>Ge", ":GoIfErr<CR>"),
    vim.keymap.set("n", "<leader>GI", ":GoImpl interface<CR>"),
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>G"] = { name = "+gopher🦡" },
      },
    },
  },
}
