-- Leader 方式（推荐）：
-- vim.g.mapleader = "," 已在init.lua中设置为空格
vim.keymap.set("n", "<leader>r", ":write | split | terminal make<CR>", { silent = true })

-- 编译快捷键
vim.keymap.set("n", "<F5>", ":write | split | terminal make<CR>", { silent = true })
