return {
    {
        "folke/persistence.nvim",
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
        opts = {
            -- add any custom options here
        },
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        init = function()
            vim.api.nvim_create_autocmd("User", {
                pattern = "OilActionsPost",
                callback = function(event)
                    if event.data.actions.type == "move" then
                        Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
                    end
                end,
            })
        end,
        keys = {
            {
                "<leader>bd",
                function()
                    Snacks.bufdelete()
                end,
                desc = "Buffer delete",
                mode = "n",
            },
            {
                "<leader>ba",
                function()
                    Snacks.bufdelete.all()
                end,
                desc = "Buffer delete all",
                mode = "n",
            },
            {
                "<leader>bo",
                function()
                    Snacks.bufdelete.other()
                end,
                desc = "Buffer delete other",
                mode = "n",
            },
            {
                "<leader>bz",
                function()
                    Snacks.zen()
                end,
                desc = "Toggle Zen Mode",
                mode = "n",
            },
            {
                "<leader>lg",
                function()
                    Snacks.lazygit()
                end,
                desc = "Toggle Lazy Git",
                mode = "n",
            },
        },
        opts = {
            bigfile = { enabled = true },
            dashboard = {
                preset = {
                    pick = nil,
                    ---@type snacks.dashboard.Item[]
                    keys = {
                        {
                            icon = " ",
                            key = "f",
                            desc = "Find File",
                            action = ":lua Snacks.dashboard.pick('files')",
                        },
                        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                        {
                            icon = " ",
                            key = "g",
                            desc = "Find Text",
                            action = ":lua Snacks.dashboard.pick('live_grep')",
                        },
                        {
                            icon = " ",
                            key = "r",
                            desc = "Recent Files",
                            action = ":lua Snacks.dashboard.pick('oldfiles')",
                        },
                        {
                            icon = " ",
                            key = "c",
                            desc = "Config",
                            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
                        },
                        { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                        {
                            icon = "󰒲 ",
                            key = "l",
                            desc = "Lazy",
                            action = ":Lazy",
                            enabled = package.loaded.lazy ~= nil,
                        },
                        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                    },
                    header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
                },
                sections = {
                    { section = "header" },
                    -- {
                    --     pane = 2,
                    --     section = "terminal",
                    --     cmd = "colorscript -e square",
                    --     height = 5,
                    --     padding = 1,
                    -- },
                    { section = "keys",  gap = 1, padding = 1 },
                    {
                        pane = 2,
                        icon = " ",
                        title = "Recent Files",
                        section = "recent_files",
                        indent = 2,
                        padding = 1,
                    },
                    { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                    {
                        pane = 2,
                        icon = " ",
                        title = "Git Status",
                        section = "terminal",
                        enabled = function()
                            return Snacks.git.get_root() ~= nil
                        end,
                        cmd = "git status --short --branch --renames",
                        height = 5,
                        padding = 1,
                        ttl = 5 * 60,
                        indent = 3,
                    },
                    { section = "startup" },
                },
            },
            explorer = { enabled = false },
            indent = { enabled = true },
            input = { enabled = false },
            picker = { enabled = false },
            notifier = { enabled = false },
            quickfile = { enabled = true },
            scope = { enabled = false },
            statuscolumn = { enabled = false },
            words = { enabled = false },
            rename = { enabled = true },
            lazygit = {
                -- your lazygit configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
                enabled = true,
            },
            zen = {
                enabled = true,
                toggles = {
                    ufo = true,
                    dim = true,
                    git_signs = false,
                    diagnostics = false,
                    line_number = false,
                    relative_number = false,
                    signcolumn = "no",
                    indent = false,
                },
            },
        },
        config = function(_, opts)
            require("snacks").setup(opts)

            Snacks.toggle.new({
                id = "ufo",
                name = "Enable/Disable ufo",
                get = function()
                    return require("ufo").inspect()
                end,
                set = function(state)
                    if state == nil then
                        require("noice").enable()
                        require("ufo").enable()
                        vim.o.foldenable = true
                        vim.o.foldcolumn = "1"
                    else
                        require("noice").disable()
                        require("ufo").disable()
                        vim.o.foldenable = false
                        vim.o.foldcolumn = "0"
                    end
                end,
            })
        end,
    },
}
