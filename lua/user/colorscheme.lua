-- local colorscheme = "tokyonight-night"
-- local colorscheme = "tokyonight-storm"
-- local colorscheme = "tokyonight-moon"
-- local colorscheme = "tokyonight-day"
-- local colorscheme = "shado"
local colorscheme = "iceberg"
-- local colorscheme = "badwolf"


local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
