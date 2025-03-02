return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup({
                ensure_installed = { 'lua_ls', 'rust_analyzer', 'gopls', 'pyright', 'ts_ls', 'java_language_server' },

                handlers = {
                    -- Default handler
                    function(server_name)
                        require('lspconfig')[server_name].setup({
                            on_attach = function(client, bufnr)
                                -- Enable format-on-save if supported
                                if client.server_capabilities.documentFormattingProvider then
                                    vim.api.nvim_create_autocmd("BufWritePre", {
                                        group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true }),
                                        buffer = bufnr,
                                        callback = function()
                                            vim.lsp.buf.format({ async = false })
                                        end,
                                    })
                                end
                            end,
                        })
                    end,

                    -- Custom handler for biome
                    biome = function()
                        require('lspconfig').biome.setup({
                            single_file_support = false,
                            on_attach = function(client, bufnr)
                                vim.api.nvim_create_autocmd("BufWritePre", {
                                    group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true }),
                                    buffer = bufnr,
                                    callback = function()
                                        vim.cmd("!biome format %")
                                    end,
                                })
                            end,
                        })
                    end,
                }
            }
            )
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    },
    -- -- Autocompletion
    -- { 'saadparwaiz1/cmp_luasnip' },
    -- {
    --     'hrsh7th/nvim-cmp',
    --     event = 'InsertEnter',
    --     config = function()
    --         local cmp = require('cmp')
    --         require('luasnip.loaders.from_vscode').lazy_load()
    --
    --         cmp.setup({
    --             sources = {
    --                 { name = 'nvim_lsp' },
    --                 { name = 'luasnip' }
    --             },
    --             preselect = 'item',
    --             completion = {
    --                 completeopt = 'menu,menuone,noinsert'
    --             },
    --             mapping = cmp.mapping.preset.insert({
    --                 ['<CR>'] = cmp.mapping.confirm({ select = true }),
    --                 ['<C-Space>'] = cmp.mapping.complete(),
    --                 ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    --                 ['<C-d>'] = cmp.mapping.scroll_docs(4),
    --             }),
    --             snippet = {
    --                 expand = function(args)
    --                     vim.snippet.expand(args.body)
    --                     require('luasnip').lsp_expand(args.body)
    --                 end,
    --             },
    --         })
    --     end
    -- },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                cmp_nvim_lsp.default_capabilities()
            )

            local lspconfig = require("lspconfig")

            lspconfig.tailwindcss.setup({
                capabilities = capabilities
            })
            lspconfig.gopls.setup({
                capabilities = capabilities
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })

            lspconfig.ts_ls.setup({
              capabilities = capabilities
            })

            lspconfig.java_language_server.setup({
              capabilities = capabilities
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
            vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
        end,
    },
}
