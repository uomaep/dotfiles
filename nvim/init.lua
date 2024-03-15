if vim.loader then
	vim.loader.enable()
end

_G.dd = function(...)
	require("util.debug").dump(...)
end
vim.print = _G.dd

require("config.lazy")

-- Floating window 배경 및 테두리 색상 설정
vim.cmd([[
highlight NormalFloat guibg=#1f2335
highlight FloatBorder guifg=white guibg=#1f2335
]])
