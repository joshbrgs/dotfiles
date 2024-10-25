-- Initialize the dap module
local dap = require('dap')

-- Start debugging
vim.keymap.set('n', '<F5>', dap.continue, { desc = "Start/Continue Debugging" })

-- Pause debugging
vim.keymap.set('n', '<F6>', dap.pause, { desc = "Pause Debugging" })

-- Stop debugging
vim.keymap.set('n', '<F7>', dap.terminate, { desc = "Stop Debugging" })

-- Step over
vim.keymap.set('n', '<F10>', dap.step_over, { desc = "Step Over" })

-- Step into
vim.keymap.set('n', '<F11>', dap.step_into, { desc = "Step Into" })

-- Step out
vim.keymap.set('n', '<F12>', dap.step_out, { desc = "Step Out" })

-- Toggle breakpoint
vim.keymap.set('n', '<leader>bp', dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })

-- View breakpoints
vim.keymap.set('n', '<leader>db', dap.list_breakpoints, { desc = "List Breakpoints" })

-- Open the REPL (Debug Console)
vim.keymap.set('n', '<leader>dr', dap.repl.open, { desc = "Open Debug REPL" })

-- Evaluate expression
-- vim.keymap.set('n', '<leader>de', dap.repl.evaluate, { desc = "Evaluate Expression" })

-- Step into next function call
vim.keymap.set('n', '<leader>si', dap.step_into, { desc = "Step Into" })

-- Step out of current function
vim.keymap.set('n', '<leader>so', dap.step_out, { desc = "Step Out" })

-- Continue to the next breakpoint
vim.keymap.set('n', '<leader>cont', dap.continue, { desc = "Continue to Next Breakpoint" })

-- Stop Debugging
vim.keymap.set('n', '<leader>stop', dap.terminate, { desc = "Stop Debugging" })

-- Start/Restart Debugging
vim.keymap.set('n', '<leader>start', dap.run_last, { desc = "Start/Restart Debugging" })

local dapui = require('dapui')

-- Open the DAP UI
vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = "Toggle DAP UI" })

-- Open the DAP UI elements individually
vim.keymap.set('n', '<leader>dv', dapui.eval, { desc = "Evaluate Variable" }) -- Evaluate selected variable
vim.keymap.set('n', '<leader>ds', dapui.float_element, { desc = "Float DAP UI" }) -- Float window for DAP UI

