local M = {}

---@type stilla.HighlightsFn
function M.get(c)
  return {
    GitSignsAdd = { fg = c.git.add },
    GitSignsChange = { fg = c.git.change },
    GitSignsDelete = { fg = c.git.delete },
    GitSignsCurrentLineBlame = { fg = c.fg_gutter },
    GitSignsAddPreview = "DiffAdd",
    GitSignsDeletePreview = "DiffDelete",
  }
end

return M
