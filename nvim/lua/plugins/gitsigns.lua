return {
  "lewis6991/gitsigns.nvim",
  opts = function(_, opts)
    opts.current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol",
      delay = 100, -- 100ms delay
    }
  end,
}
