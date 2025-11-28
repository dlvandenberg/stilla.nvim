local Util = require("stilla.util")
local M = {}

---@param opts? stilla.Config
---@return ColorScheme, stilla.Config
function M.setup(opts)
  opts = require("stilla.config").extend(opts)

  local palette = require("stilla.colors.palette")

  ---@class ColorScheme: Palette
  local colors = {}
  colors.none = "NONE"
  colors.fg = palette.platinum
  colors.bg = palette.smokey_black

  Util.bg = colors.bg
  Util.fg = colors.fg
  local WHITE = "#FFFFFF"
  local BLACK = "#000000"

  -- ui
  colors.fg_gutter = Util.blend_fg(colors.bg, 0.7, WHITE)
  colors.fg_gutter_highlight = Util.blend_fg(colors.bg, 0.5, WHITE)
  colors.bg_highlight = Util.blend_fg(colors.bg, 0.8, WHITE)
  colors.bg_visual = Util.blend_bg(colors.bg, 0.7, palette.vanilla)
  colors.bg_sidebar = colors.bg
  colors.bg_statusline = Util.blend_fg(colors.bg, 0.7, WHITE)
  colors.bg_search = Util.blend_bg(colors.bg_highlight, 0.5, palette.earth_yellow)
  colors.border = Util.blend_fg(colors.bg, 0.6, WHITE)
  colors.black = Util.blend_bg(colors.bg, 0.9, BLACK)
  colors.bg_float = Util.blend_bg(colors.bg, 0.95, WHITE)
  colors.fg_float_highlight = colors.fg_gutter_highlight

  -- syntax
  colors.comment = palette.vanilla
  colors.language = Util.blend_fg(colors.bg, 0.3, WHITE)
  colors.string = palette.earth_yellow
  colors.constant = palette.blush
  colors.builtin = palette.mountbatten
  colors.local_var = palette.moonstone
  colors.special = palette.sky_magenta
  colors.function_decl = palette.cambridge
  colors.delimiter = Util.blend_fg(colors.bg, 0.6, WHITE)
  colors.attention = Util.blend_fg(colors.fg, 0.8, palette.earth_yellow)
  colors.escape = Util.blend_fg(palette.earth_yellow, 0.5, palette.blush)
  colors.regexp = Util.blend_fg(palette.earth_yellow, 0.5, palette.sky_magenta)

  -- misc
  colors.fold = Util.blend_fg(colors.bg, 0.3, palette.moonstone)
  colors.sub = Util.blend_fg(colors.bg, 0.4, palette.blush)

  -- colors
  colors.moonstone = palette.moonstone

  -- fs
  colors.directory = palette.moonstone
  colors.filename = colors.language

  -- diagnostics
  colors.error = palette.bittersweet
  colors.warning = palette.vanilla
  colors.info = Util.blend_fg(palette.cambridge, 0.5)
  colors.hint = Util.blend_fg(palette.moonstone, 0.5)
  colors.success = Util.blend_fg(palette.cambridge, 0.8)

  -- diff
  colors.diff = {
    add = Util.blend_bg(palette.cambridge, 0.3),
    change = Util.blend_bg(palette.moonstone, 0.3),
    delete = Util.blend_bg(palette.bittersweet, 0.3),
    text = Util.blend_bg(palette.platinum, 0.3),
  }

  -- git
  colors.git = {
    add = Util.blend_bg(palette.cambridge, 0.8),
    change = Util.blend_bg(palette.moonstone, 0.8),
    delete = Util.blend_bg(palette.bittersweet, 0.8),
    ignore = Util.blend_bg(palette.platinum, 0.8),
  }

  -- Apply overrides
  opts.on_colors(colors)

  return colors, opts
end

return M
