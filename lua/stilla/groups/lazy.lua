local M = {}

---@type stilla.HighlightsFn
function M.get(c)
  return {
    LazyProgressDone = { bold = true, fg = c.success },
    LazyProgressTodo = { bold = true, fg = c.fg_gutter },
  }
end

return M
