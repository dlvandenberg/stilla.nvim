local M = {}

---@type stilla.HighlightsFn
function M.get(c)
  return {
    fugitiveStagedModifier = { fg = c.string },
    fugitiveUnstagedModifier = { fg = c.delimiter },
    fugitiveHash = { fg = c.string },
  }
end

return M
