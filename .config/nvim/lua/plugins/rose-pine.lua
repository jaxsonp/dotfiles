
-- rose color scheme
return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	priority = 1000,
	config = function ()
		require("rose-pine").setup({
			variant = "main",
			dark_variant = "main",
			dim_inactive_windows = true,
			styles = {
				bold = true,
				italic = false,
				transparency = false,
			}
		})
	end,
}
