local registry = require('mason-registry')

local util = {}

local function check_done(running_count, any_update)
  if running_count == 0 then
    if any_update then
      print('[mason-update-all] Finished updating all packages')
    else
      print('[mason-update-all] Nothing to update')
    end

    -- Trigger autocmd
    vim.schedule(function()
      vim.api.nvim_exec_autocmds('User', {
        pattern = 'MasonUpdateAllComplete',
      })
    end)
  end
end

function util.update_all()
  local any_update = false -- Whether any package was updated
  local running_count = 0  -- Currently running jobs
  local done_launching_jobs = false

  print('[mason-update-all] Fetching updates')
  -- Update the registry
  registry.update(function(success, err)
    if not success then
      print('[mason-update-all] Error fetching updates: ' .. err)

      -- Trigger autocmd
      vim.schedule(function()
        vim.api.nvim_exec_autocmds('User', {
          pattern = 'MasonUpdateAllComplete',
        })
      end)
      return
    end

    -- Iterate installed packages
    for _, pkg in ipairs(registry.get_installed_packages()) do
      running_count = running_count + 1

      -- Fetch for new version
      pkg:check_new_version(function(new_available, version)
        if new_available then
          any_update = true
          print(
            ('[mason-update-all] Updating %s from %s to %s'):format(
              pkg.name,
              version.current_version,
              version.latest_version
            )
          )
          pkg:install():on('closed', function()
            running_count = running_count - 1
            print(('[mason-update-all] Updated %s to %s'):format(pkg.name, version.latest_version))

            -- Done
            check_done(running_count, any_update)
          end)
        else
          running_count = running_count - 1
        end

        -- Done
        if done_launching_jobs then
          check_done(running_count, any_update)
        end
      end)
    end

    -- If all jobs are immediately done, do the checking here
    if running_count == 0 then
      check_done(running_count, any_update)
    end
    done_launching_jobs = true
  end)
end

function util.setup()
  vim.api.nvim_create_user_command('MasonUpdateAll', util.update_all, {})
end

--- get the operating system name
--- "windows", "mac", "linux"
function util.get_os()
  local uname = vim.loop.os_uname()
  local os_name = uname.sysname
  if os_name == "Windows_NT" then
    return "windows"
  elseif os_name == "Darwin" then
    return "mac"
  else
    return "linux"
  end
end

return util
