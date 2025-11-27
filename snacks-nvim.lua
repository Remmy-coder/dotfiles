return {
	{
		"folke/snacks.nvim",
		---@param _,
		opts = function(_, opts)
			for _, pos in ipairs({ "top", "bottom", "left", "right" }) do
				opts[pos] = opts[pos] or {}
				table.insert(opts[pos], {
					ft = "snacks_terminal",
					size = { height = 0.4 },
					title = "%{b:snacks_terminal.id}: %{b:term_title}",
					filter = function(_buf, win)
						return vim.w[win].snacks_win
							and vim.w[win].snacks_win.position == pos
							and vim.w[win].snacks_win.relative == "editor"
							and not vim.w[win].trouble_preview
					end,
				})
			end

			opts.terminal = {
				win = {
					position = "float",
					width = 0.6,
					height = 0.6,
					border = "rounded",
					winblend = 50,
				},
			}
		end,
	},
}
