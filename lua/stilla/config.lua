local M = {}

---@class stilla.Config
---@field transparent? boolean
---@field terminal_colors? boolean
---@field styles? table<string, vim.api.keyset.highlight>
---@field on_colors? fun(colors: ColorScheme)
---@field on_highlights? fun(highlights: stilla.Highlights, colors: ColorScheme)
---@field plugins? table<string, boolean|{ enabled: boolean }>
M.defaults = {
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true, bold = true },
    functions = {},
    variables = {},
  },
  on_colors = function(colors) end,
  on_highlights = function(highlights, colors) end,
  plugins = {
    -- enable all plugins when not using lazy.nvim
    -- set to false to manually enable/disable plugins
    all = package.loaded.lazy == nil,
    -- uses lazy.nvim to load plugins automatically
    auto = true,
    -- add any plugins here that you want to enable
  },
}

---@type stilla.Config
M.options = nil

---@param options? stilla.Config
function M.setup(options)
  M.options = vim.tbl_deep_extend("force", {}, M.defaults, options or {})
end

---@param opts? stilla.Config
---@return stilla.Config
function M.extend(opts)
  return opts and vim.tbl_deep_extend("force", {}, M.options, opts) or M.options
end

setmetatable(M, {
  __index = function(_, key)
    if key == "options" then
      return M.defaults
    end
  end,
})

return M
