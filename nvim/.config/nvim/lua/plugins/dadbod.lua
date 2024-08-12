return {
  {
    "tpope/vim-dadbod",
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,

    vim.keymap.set("n", "<leader>D", ":DB <CR>"),
    vim.keymap.set("n", "<leader>Dd", ":DBUIToggle<CR>"),
    vim.keymap.set("n", "<leader>Da", ":DBUIAddConnection<CR>"),
  },
  {
    "kristijanhusak/vim-dadbod-completion",
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>D", group = "Dadbod💪" },
      },
    },
  },
}
