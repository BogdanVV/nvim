return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "lua", "javascript", "typescript", "go", "css", "dockerfile", "html", "jsdoc", "json", "make", "python", "rust", "scss", "sql", "styled", "terraform", "xml", "yaml" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
