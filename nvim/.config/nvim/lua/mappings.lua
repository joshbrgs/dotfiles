-- vim.keymap.set("n", "-", vim.cmd.Ex) -- need nvim 0.8+
vim.keymap.set("n", "<space>!x", "<cmd>source %<CR>")
-- Show command palette (like VSCode)
vim.keymap.set('n', '<leader>:', ':Telescope commands<CR>', { noremap = true, silent = true })

-- Quick open (files)
vim.keymap.set('n', '<leader><space>', ':Telescope find_files<CR>', { noremap = true, silent = true })
-- Error Message
vim.api.nvim_set_keymap('n', '<leader>de', ':lua require("telescope.builtin").diagnostics({ bufnr = 0 })<CR>',
  { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>ee', ':lua vim.diagnostic.open_float(0, {scope="line"})<CR>',
--   { noremap = true, silent = true })

-- spell check
vim.keymap.set("n", "<leader>ll", ":setlocal spell spelllang=en_us<CR>")

-- lsp setup
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gr", function()
  -- Trigger the LSP references function and populate the quickfix list
  vim.lsp.buf.references()

  vim.defer_fn(function()
    -- Set up an autocmd to remap keys in the quickfix window
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "qf", -- Only apply this mapping in quickfix windows
      callback = function()
        -- Remap <Enter> to jump to the location and close the quickfix window
        vim.api.nvim_buf_set_keymap(0, "n", "<CR>", "<CR>:cclose<CR>", { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(0, "n", "q", ":cclose<CR>", { noremap = true, silent = true })

        -- Set up <Tab> to cycle through quickfix list entries
        vim.keymap.set("n", "<Tab>", function()
          local current_idx = vim.fn.getqflist({ idx = 0 }).idx
          local qflist = vim.fn.getqflist() -- Get the current quickfix list
          if current_idx >= #qflist then
            vim.cmd("cfirst")
            vim.cmd("wincmd p")
          else
            vim.cmd("cnext")
            vim.cmd("wincmd p")
          end
        end, { noremap = true, silent = true, buffer = 0 })

        vim.keymap.set("n", "<S-Tab>", function()
          local current_idx = vim.fn.getqflist({ idx = 0 }).idx
          if current_idx < 2 then
            vim.cmd("clast")
            vim.cmd("wincmd p")
          else
            vim.cmd("cprev")
            vim.cmd("wincmd p")
          end
        end, { noremap = true, silent = true, buffer = 0 })
      end,
    })
  end, 0)
end)

vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

-- see error
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

-- go to errors
vim.keymap.set("n", "[e", vim.diagnostic.goto_next)
vim.keymap.set("n", "]e", vim.diagnostic.goto_next)

-- Center upon quick up and downs
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")

-- Go add tags (using nvim-go or go.nvim)
vim.keymap.set('n', '<leader>gt', ':GoAddTag<CR>', { noremap = true, silent = true })

-- Go test generate file
vim.keymap.set('n', '<leader>gga', ':GoAddAllTest<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>grt', ':GoRmTag<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ge', ':GoIfErr<CR>', { noremap = true, silent = true })
--
-- -- Local AI Pilot Chat commands (replace with the plugin or custom command if available)
-- vim.keymap.set('n', '<leader>ll', ':ChatCodeReview<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>lb', ':ChatBugFix<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>lc', ':OpenChat<CR>', { noremap = true, silent = true })

-- Format document (like editor.action.formatDocument)
vim.keymap.set('n', '<leader>f', ':lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })

-- Toggle sidebar (file explorer like NvimTree)
-- vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Close active editor (close current buffer)
vim.keymap.set('n', '<leader>q', ':bd<CR>', { noremap = true, silent = true })

-- Find in files (similar to actions.find)
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find()
end, { desc = 'Search within current buffer' })

vim.keymap.set('n', '<leader>?', function()
  require('telescope.builtin').live_grep()
end, { desc = 'Search across all files in project' })

-- Open code actions in a floating modal window (side pane) with Lspsaga
vim.keymap.set("n", "<leader>.", "<cmd>Lspsaga code_action<CR>")

-- For visual mode (to select specific code parts)
vim.keymap.set("v", "<leader>.", "<cmd><C-U>Lspsaga range_code_action<CR>")

-- For renaming conventions
vim.keymap.set("v", "<leader>r", ":Lspsaga rename<CR>")
vim.keymap.set("v", "<leader>R", ":Lspsaga project_replace<CR>")



-- Navigate buffers
vim.keymap.set('n', '<S-l>', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-h>', ':bprevious<CR>', { noremap = true, silent = true })

-- Split windows
vim.keymap.set('n', '<leader>v', ':vsplit<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>s', ':split<CR>', { noremap = true, silent = true })

-- Comment line (toggle comment)
vim.keymap.set('n', '<leader>c', ':CommentToggle<CR>', { noremap = true, silent = true })

-- Visual Mode: Outdent lines
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })

-- Visual Mode: Indent lines
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })

-- Visual Mode: Move lines down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Visual Mode: Move lines up
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
-- Remap to switch between splits using Ctrl + h/j/k/l
-- vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
-- vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
-- vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
-- vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
-- Open terminal in a new horizontal split
-- vim.keymap.set('n', '<leader>t', ':Lspsaga term_toggle<CR>')
-- vim.keymap.set('n', '<leader>t', ':split | terminal<CR>', { noremap = true, silent = true })

-- Open terminal in a vertical split (optional)
-- vim.keymap.set('n', '<leader>vt', ':vsplit | terminal<CR>', { noremap = true, silent = true })
-- Automatically go to normal mode from terminal with Esc
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
-- Create an autocmd to map keys when Netrw is loaded
vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    -- Map 'a' to create a new file
    vim.keymap.set("n", "a", ":ene!<CR>:w<CR>", { buffer = true, silent = true }) -- Creates a new file and opens it

    -- Example: Use 'r' to refresh the directory listing
    vim.keymap.set("n", "r", "<Cmd>Rex<CR>", { buffer = true, silent = true })

    -- Example: Map 'h' to go up a directory and 'l' to open a file or directory
    vim.keymap.set("n", "h", "-", { buffer = true, silent = true })    -- Go up a directory
    vim.keymap.set("n", "l", "<CR>", { buffer = true, silent = true }) -- Open a file or directory

    -- Map 'q' to quit netrw
    vim.keymap.set("n", "q", ":q<CR>", { buffer = true, silent = true })
  end
})

vim.keymap.set("n", "<leader>on", ":ObsidianTemplate note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>")
vim.keymap.set("n", "<leader>of", ":s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>")

-- move file in current buffer to zettelkasten folder
vim.keymap.set("n", "<leader>ok", ":!mv '%:p' ~/projects/Obsidian/zettlekasten<cr>:bd<cr>")
-- delete file in current buffer
vim.keymap.set("n", "<leader>odd", ":!rm '%:p'<cr>:bd<cr>")

vim.api.nvim_set_keymap('n', '<leader>gs', ':Git<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gc', ':Git commit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gp', ':Git push<CR>', { noremap = true, silent = true })

-- Dismiss Noice Messages
vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice notice" })

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
