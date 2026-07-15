return {
  "nvim-mini/mini.files",
  opts = {
    content = {
      -- Hide all hidden files (starting with '.') by default
      filter = function(entry)
        return not vim.startswith(entry.name, ".")
      end,
    },
  },
  config = function(_, opts)
    require("mini.files").setup(opts)

    local show_dotfiles = false
    local filter_show = function(fs_entry) return true end
    local filter_hide = function(fs_entry)
      return not vim.startswith(fs_entry.name, ".")
    end

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesBufferCreate",
      callback = function(args)
        local buf_id = args.data.buf_id
        -- Map 'H' to toggle hidden files/folders
        vim.keymap.set("n", "H", function()
          show_dotfiles = not show_dotfiles
          local new_filter = show_dotfiles and filter_show or filter_hide
          require("mini.files").refresh({
            content = { filter = new_filter },
          })
        end, { buffer = buf_id, desc = "Toggle hidden files" })
      end,
    })
  end,
}
