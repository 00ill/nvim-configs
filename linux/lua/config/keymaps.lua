local keymap = vim.keymap.set
-- 리더 키를 스페이스로 설정
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- 기본 키맵
keymap("n", "<leader>w", ":w<CR>", { desc = "파일 저장" })
keymap("n", "<leader>q", ":q<CR>", { desc = "종료" })
keymap("n", "<leader>h", ":nohlsearch<CR>", { desc = "검색 하이라이트 끄기" })
-- 비주얼 모드에서 <leader>y로 시스템 클립보드 복사
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy to system clipboard" })

-- 일반 모드에서 <leader>y로 현재 줄 복사
vim.keymap.set("n", "<leader>y", '"+yy', { desc = "Copy current line to system clipboard" })

local opts = { noremap = true, silent = true, desc = "노멀 모드 줄바꿈" }
vim.keymap.set('n', '<leader>o', 'i<CR><Esc>', opts)

vim.keymap.set('n', '<leader>p', '"+p', { noremap = true, silent = true, desc = "클립보드 붙여넣기(노멀)" })
vim.keymap.set('v', '<leader>p', '"+p', { noremap = true, silent = true, desc = "클립보드 붙여넣기(비주얼)" })

-- 창 이동
keymap("n", "<C-h>", "<C-w>h", { desc = "왼쪽 창으로" })
keymap("n", "<C-j>", "<C-w>j", { desc = "아래 창으로" })
keymap("n", "<C-k>", "<C-w>k", { desc = "위 창으로" })
keymap("n", "<C-l>", "<C-w>l", { desc = "오른쪽 창으로" })
--c17 디버깅

vim.keymap.set('n', '<leader>r', function()
  vim.cmd('w')                          -- 현재 파일 저장
  local filename = vim.fn.expand('%:p') -- 전체 경로 가져오기
  vim.cmd('split | terminal')           -- 가로 분할 터미널 열기
  vim.fn.chansend(vim.b.terminal_job_id, 'g++ "' .. filename .. '" -o a.out && a.out\n')
end, { noremap = true, silent = true })
