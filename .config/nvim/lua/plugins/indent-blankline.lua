

-- indent blankline, indentation guide
return { 
	"lukas-reineke/indent-blankline.nvim",
	enabled = false,
	main = "ibl", 
	opts = {},
	config = function()
		require("ibl").setup()
	end,
}
