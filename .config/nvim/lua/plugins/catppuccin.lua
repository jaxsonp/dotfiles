

-- catppuccin, colorscheme
return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			show_end_of_buffer = true,
			dim_inactive = {
				enabled = true,
				percentage = 0.2
			},
			integrations = {
				barbecue = {
					dim_dirname = true, -- directory name is dimmed by default
					bold_basename = true,
					dim_context = false,
					alt_background = false,
				},
				beacon = true,
			}
		})
	end,
}
