return {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
        require("mini.comment").setup()
        require("mini.pairs").setup()
        -- require("mini.sessions")
        -- require("mini.map").setup()
    end,
}
