-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = function()
--     -- Only update once a week
--     local last_update_file = vim.fn.stdpath("data") .. "/lazy_mason_last_update"
--     local should_update = true
--
--     -- Check if file exists and when it was last modified
--     if vim.fn.filereadable(last_update_file) == 1 then
--       local last_update = vim.fn.getftime(last_update_file)
--       local week_in_seconds = 7 * 24 * 60 * 60
--       if (os.time() - last_update) < week_in_seconds then
--         should_update = false
--       end
--     end
--
--     if should_update then
--       -- Update timestamp file
--       vim.fn.writefile({ tostring(os.time()) }, last_update_file)
--
--       -- Ensure Mason is loaded
--       vim.defer_fn(function()
--         -- Try to update Mason packages
--         local ok, mason_update = pcall(require, "util.update-mason")
--         if ok then
--           pcall(mason_update.update_all)
--         end
--
--         -- Then update Lazy plugins
--         pcall(require("lazy").sync, { show = false })
--       end, 1000)       -- Delay by 1 second
--     end
--   end,
--   desc = "Update Mason and Lazy.nvim plugins weekly",
-- })
