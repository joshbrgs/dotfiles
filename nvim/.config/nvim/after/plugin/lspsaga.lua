require('lspsaga').setup({
  code_action_lightbulb = {
    enable = true,
    sign = true,
    enable_in_insert = false,
    sign_priority = 20,
    virtual_text = true,
  },
  code_action = {
    num_shortcut = true,
    show_server_name = true,
    extend_gitsigns = false,
  },
  ui = {
    border = "rounded",
  },
})

