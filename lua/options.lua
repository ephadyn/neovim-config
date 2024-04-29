require "nvchad.options"

vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert 4 spaces for a tab
vim.opt.relativenumber = false
vim.opt.conceallevel = 2

if vim.g.neovide then
  vim.o.guifont = "VictorMono Nerd Font:h13"
  vim.opt.linespace = 1
  vim.g.neovide_padding_top = 20
  vim.g.neovide_padding_bottom = 20
  vim.g.neovide_padding_left = 20
  vim.g.neovide_padding_right = 20
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  vim.g.neovide_cursor_vfx_particle_density = 10.0
  vim.g.neovide_cursor_vfx_particle_lifetime = 2.0
end
