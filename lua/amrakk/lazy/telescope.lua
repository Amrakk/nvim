return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		require("telescope").setup({
			defaults = {
				hidden = true,
				file_ignore_patterns = {
					".git/",
					"node_modules/",
				},
			},
		})

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>pf", function()
			builtin.find_files({ hidden = true })
		end)
		vim.keymap.set("n", "<C-p>", function()
			builtin.git_files({ hidden = true })
		end)
		vim.keymap.set("n", "<leader>pws", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word, additional_args = { "--hidden" } })
		end)
		vim.keymap.set("n", "<leader>pWs", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word, additional_args = { "--hidden" } })
		end)
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > "), additional_args = { "--hidden" } })
		end)
		vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
	end,
}
