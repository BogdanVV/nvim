return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    local fzf_lua = require("fzf-lua")
    fzf_lua.setup({})

    vim.keymap.set("n", "<C-p>", fzf_lua.files, { desc = "Fzf Files" })
    vim.keymap.set("n", "<C-\\>", fzf_lua.buffers, { desc = "Fzf buffers" })
    vim.keymap.set("n", "<C-g>", fzf_lua.grep, { desc = "Fzf grep" })
    vim.keymap.set("n", "<leader>gs", fzf_lua.git_status, { desc = "Fzf git_status" })
  end,
}
