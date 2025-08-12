local opt = vim.opt
-- 줄 번호 표시
opt.number = true
opt.relativenumber = true
-- 탭 설정
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
-- 검색 설정
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
-- 외관 설정
opt.termguicolors = true
opt.signcolumn = "yes"
opt.wrap = false
-- 백업 및 스왑 파일
opt.backup = false
opt.swapfile = false
opt.undofile = true
--검색 하이라이트
vim.o.hlsearch = true
