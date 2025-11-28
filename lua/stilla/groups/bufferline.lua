local M = {}

---@type stilla.HighlightsFn
function M.get(c, opts)
  return {
    BufferLineIndicatorSelected = { fg = c.git.change },
  }
end

return M
