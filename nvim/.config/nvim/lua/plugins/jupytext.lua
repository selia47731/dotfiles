return {
	"goerz/jupytext.vim",

	config = function()
		vim.g.jupytext_fmt = "py:percent"
		vim.g.jupytext_style = "hydrogen"

		vim.api.nvim_set_keymap("n", "<leader>jt", ":Jupytext<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>jp", ":Jupytext py<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>jr", ":Jupytext rmd<CR>", { noremap = true, silent = true })

		vim.api.nvim_create_autocmd({"BufWritePost"}, {
			pattern = {"*.ipynb", "*.py"},
			callback = function()
				vim.cmd("JupytextSync")
			end,
		})


		vim.api.nvim_create_user_command("Jupytext", function(opts)
			local format = opts.args ~= "" and opts.args or vim.g.jupytext_fmt
			vim.cmd("silent !jupytext --to " .. format .. " %")
			vim.cmd("edit!")
		end, {nargs = "?"})
	end
}

