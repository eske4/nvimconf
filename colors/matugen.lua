-- This name must match the filename for Telescope to register it correctly
local status, matugen = pcall(require, "matugen")
if status then
	matugen.apply()
else
	vim.notify("Matugen template not found. Ensure Noctalia has generated lua/matugen.lua", vim.log.levels.ERROR)
end
