return {
  "zeybek/camouflage.nvim",
  event = { "BufReadPre", "BufNewFile" },

  opts = {
    enabled = true,
    auto_enable = true,

    policy = {
      enabled = true,
      default_action = "ignore",
      rules = {
        {
          id = "env-parser-only",
          action = "mask",
          parser = { "env" },
        },
      },
    },
  },

  keys = {
    { "<leader>m", "<cmd>CamouflageToggle<cr>", desc = "Toggle Camouflage (Mask Secrets)" },
  },
}

