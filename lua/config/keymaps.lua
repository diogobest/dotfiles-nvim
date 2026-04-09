-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

local file_search_opts = {
  hidden = true,
  ignored = true,
  exclude = { ".git", ".hg", ".svn", "vcr_cassettes", "public", "node_modules" },
}

local grep_search_opts = {
  hidden = true,
  ignored = true,
  exclude = { ".git", ".hg", ".svn", "vcr_cassettes", "public/**", "node_modules/**" },
}

map("n", "<C-p>", function()
  Snacks.picker.files(file_search_opts)
end, { desc = "Find Files" })

map("n", "<C-\\>", "<leader>e", { remap = true, desc = "Explorer" })

map("n", "<leader>p", function()
  Snacks.picker.files(file_search_opts)
end, { desc = "Find Files" })

map("n", "<leader><leader>", "<C-^>", { desc = "Last File" })
-- map("n", "//", "gcc", { remap = true, desc = "Comment Line" })
-- map("x", "//", "gc", { remap = true, desc = "Comment Selection" })

map("n", "<leader>fg", function()
  Snacks.picker.grep(grep_search_opts)
end, { desc = "Grep Project" })

map("n", "<leader>sg", function()
  Snacks.picker.grep(grep_search_opts)
end, { desc = "Grep Project" })

map("n", "<leader>fd", function()
  Snacks.picker.diagnostics_buffer()
end, { desc = "Buffer Diagnostics" })

map("n", "<leader>fD", function()
  Snacks.picker.diagnostics()
end, { desc = "Workspace Diagnostics" })

map("n", "gf", function()
  for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
    if client:supports_method("textDocument/definition") then
      vim.lsp.buf.definition()
      return
    end
  end

  vim.cmd("normal! gf")
end, { desc = "Goto Definition" })

map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
