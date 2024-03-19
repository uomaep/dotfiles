-- Turn off paste mode when leaving insert (Insert 모드를 떠날 때 붙여넣기 모드 비활성화)
-- 붙여넣기 모드는 외부에서 복사한 텍스트를 붙여넣을 때 포맷이나 들여쓰기가 깨지지 않도록 도와주는 기능이지만,
-- 일반적인 편집에는 비활성화하는 것이 좋다.
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Disable the concealing in some file formats (특정 파일에서 Conceal 기능을 비활성화하도록 설정)
-- The default conceallevel is 3 in LazyVim (기본적으로 LazyVim에서는 `conceallevel`이 3으로 설정)
-- Conceal 기능은 특정 문자나 구문을 보이지 않게 하거나 다른 문자로 대체하는 기능
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
})
