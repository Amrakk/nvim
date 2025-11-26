-- Finds and lists all of the TODO, HACK, BUG, etc comment
-- in your project and loads them into a browsable list.
return  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    opts = {},
    -- stylua: ignore
    keys = {
        { "<leader>tc", "<cmd>Trouble todo toggle<cr>", desc = "Todo (Trouble)" },
    },
}
