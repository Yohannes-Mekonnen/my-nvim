vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dd", "<cmd>DBUI<CR>", { desc = "Open DBUI" })
vim.keymap.set('n', '<leader>tc', ':s/\\v<(.)/\\u\\1/g<CR>', { desc = 'Title case line' })
vim.keymap.set('v', '<leader>tc', ':s/\\v<(.)/\\u\\1/g<CR>', { desc = 'Title case selection' })

vim.keymap.set("n", "<leader>fg", function()
  require("telescope.builtin").live_grep()
end, { desc = "Live Grep (search in files)" })
