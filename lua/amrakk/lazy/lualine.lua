function lualine_opts()
    local icons = {
        diagnostics = { Error = "E", Warn = "W", Info = "I", Hint = "H" },
        git = { added = "+", modified = "~", removed = "-" },
        misc = { clock = "" },
    }

    local function git_branch()
        local ok, branch = pcall(vim.fn["FugitiveHead"])
        if ok and branch and branch ~= "" then
            return branch
        end
        return ""
    end

    local function root_dir()
        local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
        if git_root and git_root ~= "" and vim.v.shell_error == 0 then
            return vim.fn.fnamemodify(git_root, ":t")
        end
        return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
    end

    local function pretty_path()
        return function()
            local f = vim.fn.expand("%:~:.")
            if f == "" then return "[No Name]" end
            if #f > 40 then
                local tail = vim.fn.fnamemodify(f, ":t")
                local head = vim.fn.fnamemodify(f, ":h")
                head = vim.fn.fnamemodify(head, ":t")
                return head .. "/.../" .. tail
            end
            return f
        end
    end

    return {
        options = {
            theme = "auto",
            globalstatus = vim.o.laststatus == 3,
            disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
        },

        sections = {
            lualine_a = { "mode" },
            lualine_b = { git_branch },

            lualine_c = {
                { root_dir() },
                {
                    "diagnostics",
                    symbols = {
                        error = icons.diagnostics.Error,
                        warn  = icons.diagnostics.Warn,
                        info  = icons.diagnostics.Info,
                        hint  = icons.diagnostics.Hint,
                    },
                },
                { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                pretty_path(),
            },

            lualine_x = {},

            lualine_y = {
                { "progress", separator = " ", padding = { left = 1, right = 0 } },
                { "location", padding = { left = 0, right = 1 } },
            },

            lualine_z = {
                function()
                    return icons.misc.clock .. " " .. os.date("%R")
                end,
            },
        },

        extensions = { "neo-tree", "lazy", "fzf" },
    }
end

return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
        vim.g.lualine_laststatus = vim.o.laststatus
        if vim.fn.argc(-1) > 0 then
            vim.o.statusline = " "
        else
            vim.o.laststatus = 0
        end
    end,
    config = function()
        require("lualine").setup(lualine_opts())
    end,
}


