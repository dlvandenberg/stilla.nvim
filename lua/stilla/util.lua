local M = {}

M.bg = "#000000"
M.fg = "#ffffff"

---@param hex string hexcode color
local function rgb(hex)
  hex = string.lower(hex)
  return { tonumber(hex:sub(2, 3), 16), tonumber(hex:sub(4, 5), 16), tonumber(hex:sub(6, 7), 16) }
end

---@param foreground string foreground color
---@param alpha number|string number between 0 and 1. 0 is bg, 1 is fg
---@param background string background color
---@return string hexcode of the blended color
function M.blend(foreground, alpha, background)
  alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha
  local bg = rgb(background)
  local fg = rgb(foreground)

  local blendChannel = function(i)
    local result = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, result), 255) + 0.5)
  end

  return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

---@param hex string hexcode color
---@param amount number|string number between 0 and 1. 0 is bg, 1 is fg
---@param bg? string background color
---@return string hexcode of the blended color
function M.blend_bg(hex, amount, bg)
  return M.blend(hex, amount, bg or M.bg)
end

---@param hex string hexcode color
---@param amount number|string number between 0 and 1. 0 is bg, 1 is fg
---@param fg? string foreground color
---@return string hexcode of the blended color
function M.blend_fg(hex, amount, fg)
  return M.blend(hex, amount, fg or M.fg)
end

return M
