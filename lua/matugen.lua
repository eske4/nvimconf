local M = {}

function M.apply()
	require("base16-colorscheme").setup({
		-- Background tones
		base00 = "#160b32", -- Default Background
		base01 = "#241254", -- Lighter Background (status bars)
		base02 = "#21114b", -- Selection Background
		base03 = "#645e72", -- Comments, Invisibles
		-- Foreground tones
		base04 = "#b1afb6", -- Dark Foreground (status bars)
		base05 = "#f2f2f3", -- Default Foreground
		base06 = "#f2f2f3", -- Light Foreground
		base07 = "#f2f2f3", -- Lightest Foreground
		-- Accent colors
		base08 = "#fd4663", -- Variables, XML Tags, Errors
		base09 = "#db5db8", -- Integers, Constants
		base0A = "#bf5ddb", -- Classes, Search Background
		base0B = "#8a67e4", -- Strings, Diff Inserted
		base0C = "#e996d2", -- Regex, Escape Chars
		base0D = "#ac93ec", -- Functions, Methods
		base0E = "#d696e9", -- Keywords, Storage
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
