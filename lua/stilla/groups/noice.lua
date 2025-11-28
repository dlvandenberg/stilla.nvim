local M = {}

---@type stilla.HighlightsFn
function M.get(c)
  local ret = {
    NoiceCmdlineIconInput = { fg = c.attention },
    NoiceCmdlineIconLua = { fg = c.moonstone },
    NoiceCmdlinePopupBorderInput = { fg = c.attention },
    NoiceCmdlinePopupBorderLua = { fg = c.moonstone },
    NoiceCmdlinePopupTitleInput = { fg = c.attention },
    NoiceCmdlinePopupTitleLua = { fg = c.moonstone },
    NoiceCompletionItemKindDefault = { fg = c.mountbatten, bg = c.none },
  }

  require("stilla.groups.kinds").kinds(ret, "NoiceCompletionItemKind%s")
  return ret
end

return M
