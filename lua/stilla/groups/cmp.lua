local M = {}

---@type stilla.HighlightsFn
function M.get(c, opts)
  local result = {
    CmpDocumentation = { fg = c.fg, bg = c.bg_float },
    CmpDocumentationBorder = { fg = c.border, bg = c.bg_float },
    CmpGhostText = { fg = c.fg_gutter },
    CmpItemAbbr = { fg = c.fg, bg = c.none },
    CmpItemAbbrDeprecated = { fg = c.fg_gutter, bg = c.none, strikethrough = true },
    CmpItemAbbrMatch = { fg = c.attention, bg = c.none },
    CmpItemAbbrMatchFuzzy = { fg = c.attention, bg = c.none },
    CmpItemKindCodeium = { fg = c.moonstone, bg = c.none },
    CmpItemKindCopilot = { fg = c.moonstone, bg = c.none },
    CmpItemKindDefault = { fg = c.builtin, bg = c.none },
    CmpItemKindTabNine = { fg = c.moonstone, bg = c.none },
    CmpItemMenu = { fg = c.comment, bg = c.none },
  }

  require("stilla.groups.kinds").kinds(result, "CmpItemKind%s")
  return result
end

return M
