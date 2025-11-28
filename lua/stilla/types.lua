---@class stilla.Highlight: vim.api.keyset.highlight
---@field style? vim.api.keyset.highlight

---@alias stilla.Highlights table<string, stilla.Highlight|string>

---@alias stilla.HighlightsFn fun(colors: ColorScheme, opts: stilla.Config): stilla.Highlights
