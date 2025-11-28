local M = {}

---@param opts? stilla.Config
---@return ColorScheme, stilla.Highlights, stilla.Config
function M.setup(opts)
  opts = require("stilla.config").extend(opts)

  local colors = require("stilla.colors").setup(opts)
  local groups = require("stilla.groups").setup(colors, opts)

  -- Only clear when not the default colorscheme
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "stilla"

  for group, hl in pairs(groups) do
    hl = type(hl) == "string" and { link = hl } or hl
    vim.api.nvim_set_hl(0, group, hl)
  end

  -- if opts.terminal_colors then
  --   M.terminal(colors)
  -- end

  return colors, groups, opts
end

-- ---@param colors ColorScheme
-- function M.terminal(colors)
--   -- dark
--   vim.g.terminal_color_0 = colors.black
--   vim.g.terminal_color_8 = colors.surface_0
--
--   -- light
--   vim.g.terminal_color_7 = colors.khaki
--   vim.g.terminal_color_15 = colors.fg
--
--   -- colors
--   vim.g.terminal_color_1 = colors.persian
--   vim.g.terminal_color_9 = colors.indian
--
--   vim.g.terminal_color_2 = colors.asparagus
--   vim.g.terminal_color_10 = colors.pistachio
--
--   vim.g.terminal_color_3 = colors.old_gold
--   vim.g.terminal_color_11 = colors.flax
--
--   vim.g.terminal_color_4 = colors.moonstone
--   vim.g.terminal_color_12 = colors.light_blue
--
--   vim.g.terminal_color_5 = colors.gold
--   vim.g.terminal_color_13 = colors.citron
--
--   vim.g.terminal_color_6 = colors.eggplant
--   vim.g.terminal_color_14 = colors.rose
-- end

return M
