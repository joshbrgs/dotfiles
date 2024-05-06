return {
  -- add catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
  {
    "nvimdev/dashboard-nvim",
    opts = {
      theme = "hyper",
      config = {
        week_header = {
          enable = true,
        },
        packages = { enable = false },
        project = { enable = false },
        mru = { limit = 10, icon = "󰢚 ", label = "Recent Files", cwd_only = false },
        footer = {}, -- footer
        shortcut = {
          { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
          { desc = "󰄛 Lazy Extras", group = "@property", action = "LazyExtras", key = "x" },
          {
            icon = " ",
            icon_hl = "@variable",
            desc = "Files",
            group = "Label",
            action = "Telescope find_files",
            key = "f",
          },
          {
            desc = " Find Word",
            group = "DiagnosticHint",
            action = "Telescope live_grep",
            key = "w",
          },
          {
            desc = " dotfiles",
            group = "Number",
            action = "e ~/dotfiles/",
            key = "d",
          },
        },
      },
    },
  },
}
