-- ~/.config/nvim/lua/tempfile.lua

local tempfile = {}

-- Function to create a temporary file
function tempfile.create_temp_file(extension)
	local temp_filename = os.tmpname() .. (extension or ".txt")
	local temp_file = io.open(temp_filename, "w")
	if temp_file then
		temp_file:close()
		vim.cmd("edit " .. temp_filename)
		vim.cmd("autocmd BufDelete <buffer> silent! !rm " .. temp_filename)
	else
		print("Could not create temporary file.")
	end
end

-- Function to set up key mappings
function tempfile.setup(config)
	local extension = config.extension or ".txt"
	local default_command = config.default_command or "<leader>tt"

	-- Map the default command for the .txt file
	vim.api.nvim_set_keymap(
		"n",
		default_command,
		':lua require("tempfile").create_temp_file("' .. extension .. '")<CR>',
		{ noremap = true, silent = true }
	)

	-- Map other extensions
	if config.extensions then
		for ext, key in pairs(config.extensions) do
			vim.api.nvim_set_keymap(
				"n",
				key,
				':lua require("tempfile").create_temp_file("' .. ext .. '")<CR>',
				{ noremap = true, silent = true }
			)
		end
	end
end

return tempfile
