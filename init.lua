require("custom.options")
require("custom.highlights")
require("custom.keymaps")
require("custom.plugins")
require("custom.colorscheme")
require("custom.commands")

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require("custom.macos")
end
if is_win then
  require("custom.windows")
end
