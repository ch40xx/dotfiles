return {
  "lucaSartore/fastspell.nvim",
  lazy = false,
  config = function()
    require("fastspell").setup({
      -- Your other opts if any (e.g., check_near_cursor = true, adjacent_lines = 3)
    })

    -- Trigger: Check only near cursor in Insert mode (minimal distraction)
    vim.api.nvim_create_autocmd({ "InsertEnter", "TextChangedI" }, {
      callback = function()
        local row = vim.api.nvim_win_get_cursor(0)[1]
        local first_line = math.max(1, row - 3) - 1  -- 0-indexed
        local last_line = row + 3
        require("fastspell").sendSpellCheckRequest(first_line, last_line)
      end,
    })

    -- Optional: Also check on TextChanged in Normal mode (for when you paste/edit)
    vim.api.nvim_create_autocmd({ "TextChanged" }, {
      callback = function()
        local row = vim.api.nvim_win_get_cursor(0)[1]
        local first_line = math.max(1, row - 3) - 1
        local last_line = row + 3
        require("fastspell").sendSpellCheckRequest(first_line, last_line)
      end,
    })
  end,
}
