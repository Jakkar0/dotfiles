vim.g.mapleader = " "

-- NB! plugin specific keymaps are set with the plugin configuration in plugins.lua

-- move between panes with ctrl + arrow keys
vim.keymap.set("n", "<C-Up>", "<C-w>k")
vim.keymap.set("n", "<C-Down>", "<C-w>j")
vim.keymap.set("n", "<C-Left>", "<C-w>h")
vim.keymap.set("n", "<C-Right>", "<C-w>l")

-- resize panes with ctrl + alt + arrow keys
vim.keymap.set("n", "<C-A-Up>", "<cmd>resize +2<cr>")
vim.keymap.set("n", "<C-A-Down>", "<cmd>resize -2<cr>")
vim.keymap.set("n", "<C-A-Left>", "<cmd>vertical resize -2<cr>")
vim.keymap.set("n", "<C-A-Right>", "<cmd>vertical resize +2<cr>")

-- copy to system clipboard by prefixing yang with leader
vim.keymap.set({ "n", "x" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "x" }, "<leader>Y", '"+yg_')
vim.keymap.set({ "n", "x" }, "<leader>p", '"+p')
vim.keymap.set({ "n", "x" }, "<leader>P", '"+P')

-- spicy keycombo to exit terminal mode to make it easier and not conflic
-- with anything running in the terminal tools
vim.keymap.set("t", "<C-space>", "<C-\\><C-n>")
