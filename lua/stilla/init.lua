local config = require("stilla.config")

local M = {}

---@param opts? stilla.Config
function M.load(opts)
  opts = require("stilla.config").extend(opts)

  return require("stilla.theme").setup(opts)
end

M.setup = config.setup

return M
