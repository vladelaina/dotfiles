return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      -- 可选配置
      open_mapping = [[<c-\>]],
      direction = "float", -- 可选: 'vertical' | 'horizontal' | 'tab' | 'float'
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      persist_mode = true,
    })
  end,
}
