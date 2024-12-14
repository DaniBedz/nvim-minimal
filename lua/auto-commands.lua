vim.api.nvim_create_augroup("DashboardAutoOpen", { clear = true })
vim.api.nvim_create_autocmd({ "BufDelete" }, {
	group = "DashboardAutoOpen",
	callback = function()
		vim.schedule(function()
			local buffers = vim.tbl_filter(function(buf)
				return vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted and vim.api.nvim_buf_get_name(buf) ~= ""
			end, vim.api.nvim_list_bufs())

			if #buffers == 0 then
				vim.cmd("lua Snacks.dashboard()")
			end
		end)
	end,
})
