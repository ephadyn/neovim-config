-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },

  tabufline = {
    enabled = true,
  },

  statusline = {
    theme = "minimal",
  },

  cmp = {
    style = "flat_light", -- default/flat_light/flat_dark/atom/atom_colored
  },
}

return M
