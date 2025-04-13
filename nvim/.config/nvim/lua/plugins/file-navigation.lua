return {
  -- {
  -- 	"stevearc/oil.nvim",
  -- 	dependencies = { "nvim-tree/nvim-web-devicons" },
  -- 	config = function()
  -- 		require("oil").setup({
  -- 			columns = { "icon" },
  -- 			keymaps = {
  -- 				["<C-h>"] = false,
  -- 				["<C-l>"] = false,
  -- 				["<C-k>"] = false,
  -- 				["<C-j>"] = false,
  -- 				["<M-h>"] = "actions.select_split",
  -- 			},
  -- 			view_options = { show_hidden = true },
  -- 		})
  --
  -- 		-- Open parent directory in current window
  -- 		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  -- 	end,
  -- },
  ---@type LazySpec
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    dependencies = {
      -- check the installation instructions at
      -- https://github.com/folke/snacks.nvim
      "folke/snacks.nvim"
    },
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        "-",
        mode = { 'n', 'v' },
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
      {
        -- Open in the current working directory
        "<leader>cw",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
      {
        "<c-up>",
        "<cmd>Yazi toggle<cr>",
        desc = "Resume the last yazi session",
      },
    },
    ---@type YaziConfig | {}
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      keymaps = {
        show_help = "<f1>",
      },
    },
    -- 👇 if you use `open_for_directories=true`, this is recommended
    init = function()
      -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
      -- vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
  }
}
