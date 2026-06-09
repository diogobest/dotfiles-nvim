local function set_picker_path_highlights()
  vim.api.nvim_set_hl(0, "SnacksPickerDir", { fg = "#7dd3fc" })
  vim.api.nvim_set_hl(0, "SnacksPickerDirectory", { fg = "#fbbf24", bold = true })
end

return {
  {
    "folke/snacks.nvim",
    init = function()
      set_picker_path_highlights()

      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = set_picker_path_highlights,
      })
    end,
  },
}
