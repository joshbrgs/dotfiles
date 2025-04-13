return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        PATH = "prepend",
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",
          "lua_ls",
          "rust_analyzer",
          "gopls",
          "templ",
          "html",
          "cssls",
          "htmx",
          "tailwindcss",
          "ts_ls",
          "astro",
          -- "gdscript",
          -- "tsserver",
          "pylsp",
          "clangd",
          "yamlls",
          "jsonls",
          -- "hls",
          -- "zls",
          "marksman",
          "sqlls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      local configs = require("lspconfig.configs")

      lspconfig.astro.setup({
        capabilities = capabilities,
      })
      lspconfig.sqlls.setup({
        capabilities = capabilities,
      })
      lspconfig.bashls.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        -- cmd = { "lua_ls" },
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }, -- Recognize 'vim' as a global variable
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true), -- Include Neovim runtime files
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })
      lspconfig.jsonls.setup({
        capabilities = capabilities,
      })
      lspconfig.gopls.setup({
        capabilities = capabilities,
      })
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })
      lspconfig.yamlls.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
        filetypes = {
          "templ",
          "html",
          "php",
          "css",
          "javascriptreact",
          "typescriptreact",
          "javascript",
          "typescript",
          "jsx",
          "tsx",
        },
      })
      lspconfig.htmx.setup({
        capabilities = capabilities,
        filetypes = { "html", "templ" },
      })
      -- lspconfig.tailwindcss.setup({
      -- 	capabilities = capabilities,
      -- 	filetypes = {
      -- 		"templ",
      -- 		"html",
      -- 		"css",
      -- 		"javascriptreact",
      -- 		"typescriptreact",
      -- 		"javascript",
      -- 		"typescript",
      -- 		"jsx",
      -- 		"tsx",
      -- 	},
      -- 	root_dir = require("lspconfig").util.root_pattern(
      -- 		"tailwind.config.js",
      -- 		"tailwind.config.cjs",
      -- 		"tailwind.config.mjs",
      -- 		"tailwind.config.ts",
      -- 		"postcss.config.js",
      -- 		"postcss.config.cjs",
      -- 		"postcss.config.mjs",
      -- 		"postcss.config.ts",
      -- 		"package.json",
      -- 		"node_modules",
      -- 		".git"
      -- 	),
      -- })
      lspconfig.templ.setup({
        capabilities = capabilities,
        filetypes = { "templ" },
      })

      if not configs.ts_ls then
        configs.ts_ls = {
          default_config = {
            cmd = { "typescript-language-server", "--stdio" },
            capabilties = capabilities,
            filetypes = {
              "javascript",
              "javascriptreact",
              "typescript",
              "typescriptreact",
              "html",
            },
            root_dir = require("lspconfig").util.root_pattern("package.json", "tsconfig.json", ".git"),
            -- single_file_support = true,
          },
        }
      end
      lspconfig.ts_ls.setup({
        -- capabilties = capabilities,
      })

      require("lspconfig").clangd.setup({
        cmd = {
          "clangd",
          "--background-index",
          "--pch-storage=memory",
          "--all-scopes-completion",
          "--pretty",
          "--header-insertion=never",
          "-j=4",
          "--inlay-hints",
          "--header-insertion-decorators",
          "--function-arg-placeholders",
          "--completion-style=detailed",
        },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_dir = require("lspconfig").util.root_pattern("src"),
        init_option = { fallbackFlags = { "-std=c++2a" } },
        capabilities = capabilities,
        single_file_support = true,
      })

      function get_python_path()
        -- Check if there's an active virtual environment
        local venv_path = os.getenv("VIRTUAL_ENV")
        if venv_path then
          return venv_path .. "/bin/python3"
        else
          -- get os name
          local os_name = require("util.update-mason").get_os()
          -- get os interpreter path
          if os_name == "windows" then
            return "C:/python312"
          elseif os_name == "linux" then
            return "/usr/bin/python3"
          else
            return "/Library/Frameworks/Python.framework/Versions/3.11/bin/python3"
          end
          -- Fallback to global Python interpreter
        end
      end

      lspconfig.pylsp.setup({
        capabilties = capabilities,
        settings = {
          python = {
            pythonPath = get_python_path(),
          },
        },
      })

      lspconfig.marksman.setup({
        capabilties = capabilities,
      })
    end,
  },
}
