-- return {
--     'nvim-telescope/telescope.nvim', tag = '0.1.8',
--      dependencies = { 'nvim-lua/plenary.nvim' }
-- }


return {
  "nvim-telescope/telescope.nvim", tag = '0.1.8',
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy=false,
  cmd = "Telescope", -- optional lazy loading
  config = function()
    local telescope = require("telescope")
    telescope.setup({}) -- you can pass setup options here

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
  end,
}

