return {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "VeryLazy",
    config = function()
        -- Fold settings
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true

        -- Treesitter as fold provider
        vim.keymap.set("n", "zR", require("ufo").openAllFolds)
        vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
        vim.keymap.set("n", "zK", function()
            local winid = require("ufo").peekFoldedLinesUnderCursor()
        end, { desc = "Peek Fold" })

        -- Setup UFO
        require("ufo").setup({
            provider_selector = function(bufnr, filetype, buftype)
                return { "treesitter", "indent" }
            end,
        })

        -- Optional: Set highlight color for fold column and virtual text
        --     vim.cmd([[
        --   highlight Folded guibg=NONE guifg=#888888
        --   highlight FoldColumn guibg=NONE guifg=#555555
        -- ]])
    end,
}
