return {
  "mgierada/lazydocker.nvim",
  dependencies = {
    "akinsho/toggleterm.nvim",
  },
  keys = {
    {
      "<leader>dd",
      function()
        require("lazydocker").open()
      end,
      desc = "Docker: Lazydocker",
    },
  },
  config = function()
    require("lazydocker").setup({
      border = "curved",
      width = 0.9,
      height = 0.9,
    })
  end,
}
