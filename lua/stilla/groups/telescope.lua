local M = {}

---@type stilla.HighlightsFn
function M.get(c)
  return {
    TelescopeBorder = { fg = c.border, bg = c.bg_float },
    TelescopeNormal = { fg = c.fg, bg = c.bg_float },
    TelescopePromptBorder = { fg = c.fg_float_highlight, bg = c.bg_float },
    TelescopePromptTitle = { fg = c.fg_float_highlight, bg = c.bg_float },
    TelescopeResultsComment = { fg = c.fg_gutter_highlight },
    TelescopeSelection = { fg = c.comment, bg = c.bg_float, bold = true },
    TelescopeSelectionCaret = { fg = c.moonstone },
    TelescopeMatching = { fg = c.constant },
  }
end

return M
