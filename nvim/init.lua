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
--vim.env.TMP    = "C:/Users/zerone/AppData/Local/nvim-temp"
--vim.env.TEMP   = "C:/Users/zerone/AppData/Local/nvim-temp"
--vim.env.TMPDIR = "C:/Users/zerone/AppData/Local/nvim-temp"
vim.cmd [[
  set cursorline
  highlight CursorLine guibg=#2a2a2a
]]


-- 기본 설정 로드
require("config.options")
require("config.keymaps")
-- 플러그인 설정 로드
require("lazy").setup("plugins")