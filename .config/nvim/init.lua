-- bootstrap lazy.nvim, LazyVim and your plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")
require("config.clipboard")

-- 设置终端模式的键映射
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 } -- 确保这些映射仅在终端缓冲区生效
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts) -- 终端内的窗口切换：向左
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts) -- 终端内的窗口切换：向下
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts) -- 终端内的窗口切换：向上
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts) -- 终端内的窗口切换：向右
end

-- 应用终端键映射
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()") -- 在打开终端时自动调用 set_terminal_keymaps 函数
