return {
  {
    "vim-test/vim-test",
    dependencies = {
      "preservim/vimux",
    },
    vim.keymap.set("n", "<leader>tt", ":TestNearest<CR>"),
    vim.keymap.set("n", "<leader>tT", ":TestFile<CR>"),
    vim.keymap.set("n", "<leader>ta", ":TestSuite<CR>"),
    vim.keymap.set("n", "<leader>tl", ":TestLast<CR>"),
    vim.cmd("let test#strategy = 'vimux'"),
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>t", group = "test" },
      },
    },
  },
}
