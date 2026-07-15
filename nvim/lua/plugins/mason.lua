return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "shfmt",
      "gofumpt",
      "goimports",
      "black",
      "biome",
      "sqlfluff",
    },
  },
}
