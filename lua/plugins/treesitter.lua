return {
  {
    "nvim-treesitter/nvim-treesitter",
    main = "nvim-treesitter.configs",
    lazy = false,
    config = function()
      require("nvim-treesitter.configs").setup({
          ensure_installed = {
            "elixir",
            "heex",
            "eex"
          },
          highlight = { enable = true }
        })
    end,
  }
}
