local M = {}

---@type stilla.HighlightsFn
function M.get(c)
  return {
    FzfLuaBorder = { fg = c.border, bg = c.bg_float },
    FzfLuaNormal = { fg = c.fg, bg = c.bg_float },
    FzfLuaCursor = "IncSearch",
    FzfLuaDirPart = { fg = c.fg_gutter },
    FzfLuaFilePart = "FzfLuaFzfNormal",
    FzfLuaFzfCursorLine = "Visual",
    FzfLuaFzfNormal = { fg = c.fg },
    FzfLuaFzfPointer = { fg = c.attention },
    FzfLuaFzfSeparator = { fg = c.moonstone, bg = c.bg_float },
    FzfLuaHeaderBind = "@punctuation.special",
    FzfLuaHeaderText = "Title",
    FzfLuaPath = "Directory",
    FzfLuaPreviewTitle = { fg = c.fg_float_highlight, bg = c.bg_float },
    FzfLuaTitle = { fg = c.string, bg = c.bg_float },
  }
end

return M
