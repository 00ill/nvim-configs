-- Bootstrap lazy.nvim (플러그인 매니저)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.cmd [[
  set cursorline
  highlight CursorLine guibg=#2a2a2a
]]

require("config.options")
require("config.keymaps")
require("lazy").setup("plugins")