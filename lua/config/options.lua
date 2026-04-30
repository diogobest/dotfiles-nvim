-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

vim.g.autoformat = false

opt.backspace = { "indent", "eol", "start" }
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.history = 1000
opt.ruler = true
opt.hlsearch = true
opt.showcmd = true
opt.incsearch = true
opt.laststatus = 2
opt.autowrite = true
opt.ignorecase = true
opt.smartcase = true
opt.showmode = true
opt.visualbell = true
opt.errorbells = false
opt.wrap = false
opt.modeline = true
opt.modelines = 5
opt.modelineexpr = false
opt.tabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.expandtab = true
opt.textwidth = 120
opt.colorcolumn = "+1"
opt.number = true
opt.numberwidth = 5
opt.relativenumber = true
opt.wildmode = { "list:longest", "list:full" }
opt.wildignore:append({ "*/tmp/*", "*/node_modules/*", "*/public/*", "*.so", "*.swp", "*.zip", "*.cache" })
opt.list = true
opt.listchars = { tab = "»·", trail = "·", nbsp = "·" }
opt.spellfile = vim.fn.expand("~/.vim-spell.utf-8.add")
opt.complete:append("kspell")
opt.clipboard = ""
opt.diffopt:append({ "closeoff", "vertical" })
opt.splitbelow = true
opt.splitright = true
opt.spelllang = { "en_us", "pt_br" }
opt.background = "dark"

vim.g.html_indent_tags = "li\\|p"

if vim.fn.executable("rg") == 1 then
  opt.grepprg = "rg --vimgrep --smart-case -g '!public/**' -g '!node_modules/**'"
elseif vim.fn.executable("ag") == 1 then
  opt.grepprg = "ag --vimgrep --smart-case"
end

if vim.fn.has("persistent_undo") == 1 then
  local undodir = vim.fn.stdpath("state") .. "/undo"
  vim.fn.mkdir(undodir, "p")
  opt.undodir = undodir
  opt.undofile = true
end

local local_configs = {
  vim.fn.expand("~/.nvimrc.local"),
  vim.fn.expand("~/.vimrc.local"),
}

for _, path in ipairs(local_configs) do
  if vim.fn.filereadable(path) == 1 then
    vim.cmd.source(path)
    break
  end
end

vim.diagnostic.config({
  virtual_text = true,
  underline = true,
  signs = true,
})
