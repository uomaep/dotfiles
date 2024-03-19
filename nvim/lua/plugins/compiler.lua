return {
  { -- This plugin
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = { "stevearc/overseer.nvim" },
    opts = {},
    keys = {
      { "<F6>", "<Cmd>CompilerOpen<CR>", desc = "CompilerOpen" },
      { "<S-F6>", "<Cmd>CompilerRedo<CR>", desc = "CompilerRedo" },
      { "<F7>", "<Cmd>CompilerToggleResults<CR>", desc = "CompilerToggleResults" },
    },
  },
  { -- The task runner we use
    "stevearc/overseer.nvim",
    commit = "68a2d344cea4a2e11acfb5690dc8ecd1a1ec0ce0",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 5,
        max_height = 25,
        default_detail = 1,
      },
    },
    keys = {
      { "<F6>", "<Cmd>CompilerOpen<CR>", desc = "CompilerOpen" },
      { "<S-F6>", "<Cmd>CompilerRedo<CR>", desc = "CompilerRedo" },
      { "<S-F7>", "<Cmd>CompilerToggleResults<CR>", desc = "CompilerToggleResults" },
    },
  },
}
