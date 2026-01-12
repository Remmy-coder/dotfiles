vim.opt.autoread = true
vim.opt.hidden = true
vim.opt.updatetime = 300

vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI" }, {
	callback = function()
		-- Don't interrupt command-line mode
		if vim.fn.mode() ~= "c" then
			vim.cmd("checktime")
		end
	end,
})

vim.keymap.set("n", "<leader>R", function()
	if vim.bo.modified then
		vim.notify("Buffer has unsaved changes", vim.log.levels.WARN)
	else
		vim.cmd("edit")
	end
end, { desc = "Reload buffer from disk (safe)" })
