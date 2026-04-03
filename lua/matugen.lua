local M = {}

function M.apply()
	require("base16-colorscheme").setup({
		-- Background tones
		base00 = "#03243a", -- Default Background
		base01 = "#0f3a57", -- Lighter Background (status bars)
		base02 = "#0b3550", -- Selection Background
		base03 = "#5e6e73", -- Comments, Invisibles
		-- Foreground tones
		base04 = "#afb5b6", -- Dark Foreground (status bars)
		base05 = "#f2f3f3", -- Default Foreground
		base06 = "#f2f3f3", -- Light Foreground
		base07 = "#f2f3f3", -- Lightest Foreground
		-- Accent colors
		base08 = "#fd4663", -- Variables, XML Tags, Errors
		base09 = "#673bf7", -- Integers, Constants
		base0A = "#3b6ef7", -- Classes, Search Background
		base0B = "#54d1f8", -- Strings, Diff Inserted
		base0C = "#a084fa", -- Regex, Escape Chars
		base0D = "#85defa", -- Functions, Methods
		base0E = "#84a4fa", -- Keywords, Storage
		base0F = "#900017", -- Deprecated, Embedded Tags
	})
	vim.g.colors_name = "matugen"
end

-- Keep your signal handler here so it reloads if the system theme changes
local signal = vim.uv.new_signal()
signal:start(
	"sigusr1",
	vim.schedule_wrap(function()
		if vim.g.colors_name == "matugen" then
			package.loaded["matugen"] = nil
			require("matugen").apply()
		end
	end)
)

return M
