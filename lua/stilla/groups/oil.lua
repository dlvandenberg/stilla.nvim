local M = {}

---@type stilla.HighlightsFn
function M.get(c)
  return {
    OilHidden = { fg = c.fg_gutter, style = { italic = true } },
  }
end

return M
