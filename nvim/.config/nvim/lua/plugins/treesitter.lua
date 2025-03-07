return { {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
        ensure_installed = {
            "astro",
            "bash",
            "c",
            "cmake",
            "css",
            "diff",
            "dockerfile",
            "gitignore",
            "go",
            "gomod",
            "gosum",
            "gowork",
            "html",
            "javascript",
            "java",
            "json",
            "lua",
            "luadoc",
            "markdown",
            "markdown_inline",
            "prisma",
            "python",
            "query",
            "rust",
            "sql",
            "toml",
            "tsx",
            "typescript",
            "vim",
            "yaml",
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)

            -- MDX
            vim.filetype.add({
                extension = {
                    mdx = "mdx",
                },
            })
            vim.treesitter.language.register("markdown", "mdx")
        end,
    },
},
    {
        "nvim-treesitter/playground",
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        enabled = false,
    },
}
