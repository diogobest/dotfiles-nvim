-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
local vimrc_ex = vim.api.nvim_create_augroup("vimrcEx", { clear = true })

vim.api.nvim_create_autocmd("BufReadPost", {
  group = vimrc_ex,
  callback = function(args)
    if vim.bo[args.buf].filetype == "gitcommit" then
      return
    end

    local last_pos = vim.fn.line([['"]])
    local last_line = vim.fn.line("$")
    if last_pos > 0 and last_pos <= last_line then
      vim.cmd([[normal! g`"]])
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = vimrc_ex,
  pattern = "Appraisals",
  callback = function()
    vim.bo.filetype = "ruby"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = vimrc_ex,
  pattern = "*.md",
  callback = function()
    vim.bo.filetype = "markdown"
    vim.opt_local.textwidth = 80
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = vimrc_ex,
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = vimrc_ex,
  pattern = "gitcommit",
  callback = function()
    vim.opt_local.textwidth = 72
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = vimrc_ex,
  pattern = { "css", "scss", "sass" },
  callback = function()
    vim.opt_local.iskeyword:append("-")
  end,
})

vim.api.nvim_create_autocmd("VimResized", {
  group = vimrc_ex,
  callback = function()
    vim.cmd.wincmd("=")
  end,
})
