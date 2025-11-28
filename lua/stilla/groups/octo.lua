local M = {}

---@type stilla.HighlightsFn
function M.get(c)
  return {
    OctoViewer = { fg = c.moonstone },
  }
end

return M
