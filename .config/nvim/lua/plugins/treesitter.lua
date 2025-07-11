-- Tree Sitter
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
          auto_install = true,
          ensure_installed = {
            "python", "c", "bash", "markdown","java","rust","typescript","javascript"},
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
}

