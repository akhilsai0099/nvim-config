return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            {
                "mason-org/mason.nvim",
                opts = {},
            },
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ts_ls", "eslint", "pylsp" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            vim.lsp.config("lua_ls", {
                settings = {
                    ["lua_ls"] = {},
                },
                capabilities = capabilities,
            })
            vim.lsp.config("ts_ls", {
                settings = {
                    ["ts_ls"] = {},
                },
                capabilities = capabilities,
            })
            vim.lsp.config("eslint", {
                settings = {
                    ["eslint"] = {},
                },
                capabilities = capabilities,
            })
            vim.lsp.config("gh_actions_ls", {
                settings = {
                    ["gh_actions_ls"] = {},
                },
                capabilities = capabilities,
            })
            vim.lsp.config("pylsp", {
                settings = {
                    ["pylsp"] = {},
                },
                capabilities = capabilities,
            })
            vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
