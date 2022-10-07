require('uomaep.base')
require('uomaep.highlights')
require('uomaep.maps')
require('uomaep.plugins')

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require('uomaep.macos')
end
if is_win then
  require('uomaep.windows')
end
