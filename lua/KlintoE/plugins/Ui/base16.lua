return {
	"RRethy/base16-nvim",
	lazy = false, -- Ensure it's available for the theme switcher
	priority = 1000,
	config = function()
		require("matugen").apply()
	end,
}
