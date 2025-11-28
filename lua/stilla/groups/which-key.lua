local M = {}

---@type stilla.HighlightsFn
function M.get(c)
  return {
    WhichKey = "NormalFloat",
    WhichKeyGroup = { fg = c.moonstone },
    WhichKeyBorder = "FloatBorder",
    WhichKeyDesc = { fg = c.fg },
    WhichKeyValue = { fg = c.bg_visual },
    WhichKeySeparator = { fg = c.comment },
  }
end

return M
