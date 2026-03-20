-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

local file_search_opts = {
  hidden = true,
  ignored = true,
  exclude = { ".git", ".hg", ".svn", "vcr_cassettes" },
}

map("n", "<C-p>", function()
  Snacks.picker.files(file_search_opts)
end, { desc = "Find Files" })

map("n", "<C-\\>", function()
  Snacks.picker.files(file_search_opts)
end, { desc = "Find Files" })

map("n", "<leader>p", function()
  Snacks.picker.files(file_search_opts)
end, { desc = "Find Files" })

map("n", "<leader>fg", function()
  Snacks.picker.grep()
end, { desc = "Grep Project" })

map("n", "<leader>fd", function()
  Snacks.picker.diagnostics_buffer()
end, { desc = "Buffer Diagnostics" })

map("n", "<leader>fD", function()
  Snacks.picker.diagnostics()
end, { desc = "Workspace Diagnostics" })

map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
