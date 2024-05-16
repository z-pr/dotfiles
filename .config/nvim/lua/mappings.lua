require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
vim.keymap.set("n", "<tab>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-tab>", ":bprevious<CR>", { desc = "Previous buffer" })
