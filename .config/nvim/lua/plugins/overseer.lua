return {
  "stevearc/overseer.nvim",
  opts = {
    task_list = {
      direction = "bottom", -- 显示任务列表
    },
    task_exec = {
      -- 使用 Neovim 内置终端来显示任务的输出
      strategy = "term",
      close_on_exit = false, -- 执行后不会关闭终端窗口
    },
  },
  config = function(_, opts)
    require("overseer").setup(opts)
  end,
}
