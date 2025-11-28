local M = {}

M.plugins = {
  ["bufferline.nvim"] = "bufferline",
  ["gitsigns.nvim"] = "gitsigns",
  ["lazy.nvim"] = "lazy",
  ["telescope.nvim"] = "telescope",
  ["fzf-lua"] = "fzf",
  -- ["render-markdown.nvim"] = "markdown",
  ["nvim-treesitter-context"] = "treesitter-context",
  ["neotest"] = "neotest",
  ["nvim-cmp"] = "cmp",
  ["noice.nvim"] = "noice",
  ["which-key.nvim"] = "which-key",
  ["octo.nvim"] = "octo",
  ["oil.nvim"] = "oil",
  ["vim-fugitive"] = "fugitive",
}

---@param name string
---@param colors ColorScheme
---@param opts stilla.Config
---@return stilla.Highlights
function M.get(name, colors, opts)
  local module = M.get_group(name)
  return module.get(colors, opts)
end

---@param name string
function M.get_group(name)
  return require("stilla.groups." .. name)
end

---@param colors ColorScheme
---@param opts stilla.Config
function M.setup(colors, opts)
  -- always on
  local groups = {
    base = true,
    kinds = true,
    semantic_tokens = true,
    treesitter = true,
  }

  if opts.plugins.all then
    -- Enable all plugins
    for _, group in pairs(M.plugins) do
      groups[group] = true
    end
  elseif opts.plugins.auto and package.loaded.lazy then
    -- Enable plugins based on lazy.nvim
    local plugins = require("lazy.core.config").plugins
    for plugin, group in pairs(M.plugins) do
      if plugins[plugin] then
        groups[group] = true
      end
    end
    -- TODO: Handle mini.nvim
  end

  -- Manually enable / disable plugins
  for plugin, group in pairs(M.plugins) do
    local use = opts.plugins[group]
    use = use == nil and opts.plugins[plugin] or use
    if use ~= nil then
      if type(use) == "table" then
        use = use.enabled
      end
      groups[group] = use or nil
    end
  end

  local hl_groups = {}
  for group in pairs(groups) do
    for key, val in pairs(M.get(group, colors, opts)) do
      hl_groups[key] = val
    end
  end

  M.resolve(hl_groups)

  -- override highlights
  opts.on_highlights(hl_groups, colors)

  return hl_groups, groups
end

---@param groups stilla.Highlights
---@return stilla.Highlights
function M.resolve(groups)
  for _, hl in pairs(groups) do
    if type(hl.style) == "table" then
      for k, v in pairs(hl.style) do
        hl[k] = v
      end
      hl.style = nil
    end
  end
  return groups
end

return M
