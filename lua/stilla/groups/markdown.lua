local Util = require("stilla.util")

local M = {}

---@type stilla.HighlightsFn
function M.get(c)
  local result = {
    RenderMarkdownBullet = { fg = c.constant },
    RenderMarkdownCode = { fg = c.bg_visual },
    RenderMarkdownDash = { fg = c.constant },
    RenderMarkdownTableHead = { fg = c.attention },
    RenderMarkdownTableRow = { fg = c.function_decl },
    RenderMarkdownCodeInline = "@markup.raw.markdown_inline",
  }

  -- for i, color in ipairs(c.rainbow) do
  --   result["RenderMarkdownH" .. i .. "Bg"] = { bg = Util.blend_bg(color, 0.1) }
  --   result["RenderMarkdownH" .. i .. "Fg"] = { fg = color, bold = true }
  -- end

  return result
end

return M
