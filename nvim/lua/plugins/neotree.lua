return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = false,
        hide_dotfiles = true,
        hide_gitignored = true,
      },
      window = {
        mappings = {
          ["H"] = function(state)
            require("neo-tree.sources.filesystem.commands").toggle_hidden(state)
            require("neo-tree.sources.filesystem.commands").toggle_git_ignored(state)
          end,
        },
      },
    },
  },
}
