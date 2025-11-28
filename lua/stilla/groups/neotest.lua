local M = {}

---@type stilla.HighlightsFn
function M.get(c)
  return {
    NeotestAdapterName = { fg = c.function_decl, bold = true },
    NeotestBorder = { fg = c.border },
    NeotestDir = { fg = c.directory },
    NeotestExpandMarker = { fg = c.bg_visual },
    NeotestFailed = { fg = c.error },
    NeotestFile = { fg = c.filename },
    NeotestFocused = { fg = c.attention, bold = true, underline = true },
    NeotestIndent = { fg = c.fg_gutter },
    NeotestMarked = { fg = c.special, bold = true },
    NeotestNamespace = { fg = c.string },
    NeotestPassed = { fg = c.success },
    NeotestRunning = { fg = c.hint },
    NeotestSkipped = { fg = c.language },
    NeotestTarget = { fg = c.fg_gutter_highlight },
    NeotestTest = { fg = c.fg },
    NeotestWinSelect = { fg = c.moonstone },
    NeotestUnknown = { fg = c.fg },
  }
end

return M
