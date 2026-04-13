return {
	"HiPhish/rainbow-delimiters.nvim",
	dependencies = "nvim-treesitter/nvim-treesitter",
	config = function()
		require("rainbow-delimiters.setup").setup({
			-- We tell the plugin: "If you see these 'languages', walk away."
			blacklist = { "oil", "noice", "notify" },
		})
	end,
}
