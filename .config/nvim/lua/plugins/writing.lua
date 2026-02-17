-- writing.lua
-- Blog Writing : MDX, Markdown, LaTeX math rendering
return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		ft = { "markdown", "mdx" },
		opts = {
			file_types = { "markdown", "mdx" },
			-- clean writing
			render_modes = { "n", "c" },
			heading = {
				sign = false,
				icons = { "#", "##", "###", "####", "#####", "######" },
			},
			code = {
				sign = false,
				width = "block",
				right_pad = 1,
			},
			latex = { enabled = true },
		},
	},

	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_complier_method = "latexmk"
			vim.g.vimtex_mappings_enabled = 0
			vim.g.vimtex_syntax_conceal = {
				accents = 1,
				ligatures = 1,
				cites = 1,
				fancy = 1,
				footnotes = 1,
				greek = 1,
				math_bounds = 1,
				math_delimiters = 1,
				math_fracs = 1,
				math_super_sub = 1,
				math_symbols = 1,
				sections = 0,
				styles = 1,
			}
		end,
	},

	{
		"davidmh/mdx.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
}
