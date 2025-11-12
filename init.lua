-- Neovim configuration
-- Feature: uuuuuuuuuuu pattern implementation

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Custom function to demonstrate the uuuuu feature
function InsertUPattern()
  local pattern = "uuuuuuuuuuu"
  vim.api.nvim_put({pattern}, 'c', true, true)
end

-- Key mapping for the uuuuu feature
vim.keymap.set('n', '<leader>u', InsertUPattern, { desc = 'Insert u pattern' })
