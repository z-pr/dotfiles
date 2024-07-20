local map = vim.keymap.set

-- telescope mappings
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<C-f>", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
	"n",
	"<leader>fa",
	"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
	{ desc = "telescope find all files" }
)

-- buffers
map("n", "<tab>", vim.cmd.bnext, { desc = "Next buffer" })
map("n", "<S-tab>", vim.cmd.bprevious, { desc = "Previous buffer" })
map("n", "<leader>x", vim.cmd.bd, { desc = "Close buffer" })

-- No highlight
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

-- Explorer
map("n", "<C-\\>", vim.cmd.Ex)

-- Normal mode
map("i", "jj", "<Esc>")

map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

-- Diagnostic float window
map("n", "<leader>e", vim.diagnostic.open_float)
