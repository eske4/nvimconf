local M = {}

function M.apply()
	require("base16-colorscheme").setup({
		-- Background tones
		base00 = "#121316", -- Default Background
		base01 = "#1e2023", -- Lighter Background (status bars)
		base02 = "#292a2d", -- Selection Background
		base03 = "#8e9099", -- Comments, Invisibles
		-- Foreground tones
		base04 = "#c4c6d0", -- Dark Foreground (status bars)
		base05 = "#e3e2e6", -- Default Foreground
		base06 = "#e3e2e6", -- Light Foreground
		base07 = "#e3e2e6", -- Lightest Foreground
		-- Accent colors
		base08 = "#ffb4ab", -- Variables, XML Tags, Errors
		base09 = "#dcbce1", -- Integers, Constants
		base0A = "#bec7dc", -- Classes, Search Background
		base0B = "#aac7ff", -- Strings, Diff Inserted
		base0C = "#dcbce1", -- Regex, Escape Chars
		base0D = "#aac7ff", -- Functions, Methods
		base0E = "#bec7dc", -- Keywords, Storage
		base0F = "#93000a", -- Deprecated, Embedded Tags
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
