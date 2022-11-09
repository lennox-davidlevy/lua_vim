local colorscheme = "warlock_custom"
-- local colorscheme = "warlock_transparent"


local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
