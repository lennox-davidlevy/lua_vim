-- local colorscheme = "tokyonight-night"
-- local colorscheme = "tokyonight-storm"
local colorscheme = "tokyonight-moon"
-- local colorscheme = "shado"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
