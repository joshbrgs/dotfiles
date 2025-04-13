return {
  -- {
  --   'saghen/blink.cmp',
  --   dependencies = 'rafamadriz/friendly-snippets',
  --
  --   version = 'v0.*',
  --
  --   opts = {
  --     keymap = { preset = 'default' },
  --
  --     appearance = {
  --       use_nvim_cmp_as_default = true,
  --       nerd_font_variant = 'mono'
  --     },
  --
  --     signature = { enabled = true }
  --   },
  -- },
  --
  -- {
  --   "neovim/nvim-lspconfig",
  --   dependencies = {
  --     'saghen/blink.cmp',
  --     {
  --       "folke/lazydev.nvim",
  --       opts = {
  --         library = {
  --           { path = "${3rd}/luv/library", words = { "vim%.uv" } },
  --         },
  --       },
  --     },
  --   },
  --   config = function()
  --     local capabilities = require('blink.cmp').get_lsp_capabilities()
  --     require("lspconfig").lua_ls.setup { capabilites = capabilities }
  --     -- import mason_lspconfig plugin
  --     local mason_lspconfig = require("mason-lspconfig")
  --     local lspconfig = require("lspconfig")
  --
  --     vim.api.nvim_create_autocmd('LspAttach', {
  --       callback = function(args)
  --         local c = vim.lsp.get_client_by_id(args.data.client_id)
  --         if not c then return end
  --
  --         if vim.bo.filetype == "lua" then
  --           -- Format the current buffer on save
  --           vim.api.nvim_create_autocmd('BufWritePre', {
  --             buffer = args.buf,
  --             callback = function()
  --               vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
  --             end,
  --           })
  --         end
  --       end,
  --     })
  --
  --     mason_lspconfig.setup_handlers({
  --       -- default handler for installed servers
  --       function(server_name)
  --         lspconfig[server_name].setup({
  --           capabilities = capabilities,
  --         })
  --       end,
  --     })
  --   end,
  -- }

	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		-- adds function arg help while typing out functions!!!
		"hrsh7th/cmp-nvim-lsp-signature-help",
	},
	{
		"kdheepak/cmp-latex-symbols",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local lspkind = require("lspkind")
			local luasnip = require("luasnip")

			-- luasnip.add_snippets("markdown", require("snippets.notes"))
			-- luasnip.add_snippets("text", require("snippets.notes"))
			-- luasnip.add_snippets("tex", require("snippets.latex"))
			-- luasnip.add_snippets("zig", require("snippets.zig"))
			-- Set up nvim-cmp.
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

			cmp.setup({
				preselect = cmp.PreselectMode.None,
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = { border = "solid" },
					documentation = { border = "solid" },
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					-- ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<CR>"] = cmp.mapping.confirm({ select = true }),

					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
					{ name = "nvim_lsp_signature_help" }, -- function arg popups while typing
				}, {
					{ name = "buffer" },
					{ name = "latex_symbols" },
				}),
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						local kind_icons = {
							Function = "λ", -- Lambda symbol for functions
							Method = "∂", -- Lambda symbol for methods
							Field = "󰀫", -- Lambda symbol for methods
							Property = "󰀫", -- Lambda symbol for methods
							Keyword = "k", -- Lambda symbol for methods
							Struct = "π", -- Lambda symbol for methods
							Struct = "Π", -- Lambda symbol for methods
							Enum = "τ", -- Lambda symbol for methods
							EnumMember = "τ", -- Lambda symbol for methods
							Snippet = "⊂",
							Text = "τ",
							Module = "⌠",
						}

						local kind = lspkind.cmp_format({
							mode = "symbol_text",

							symbol_map = kind_icons, -- Override default symbols
						})(entry, vim_item)
						local strings = vim.split(kind.kind, "%s", { trimempty = true })
						kind.kind = " " .. (strings[1] or "") .. " "
						kind.menu = "    " .. (strings[2] or "") .. ""

						return kind
					end,
				},
			})
		end,
	},
}
