function py_formatter(filepath)
	local command = "python3 -m autopep8 -i " .. vim.fn.shellescape(filepath)
	vim.fn.system(command)
end
function lua_formatter(filepath)
	local command = "stylua " .. vim.fn.shellescape(filepath)
	vim.fn.system(command)
end
local formatter_table = {
	py = py_formatter,
	lua = lua_formatter,
}

function GetFileExtension(filepath)
	return filepath:match("^.+%.(.+)$")
end

_G.my_formatter = function()
	-- Get the current active buffer
	local current_buffer = vim.api.nvim_get_current_buf()

	-- Check if the buffer has a file associated with it
	if vim.api.nvim_buf_get_option(current_buffer, "buftype") ~= "" then
		print("No file associated with the buffer")
		return
	end

	-- Get the real filepath of the buffer
	local real_filepath = vim.api.nvim_buf_get_name(current_buffer)
	if real_filepath == "" then
		print("No filepath associated with the buffer")
		return
	end

	-- Check if the file is a Python file
	local ext = GetFileExtension(real_filepath)
	print("file ext name is " .. ext)
	if formatter_table[ext] == nil then
		print(ext .. " file not have formatter")
		return
	end

	vim.cmd("silent :w")
	formatter_table[ext](real_filepath)
	vim.cmd("silent :e!")

	-- print('Python file formatted')
end

vim.api.nvim_set_keymap("n", "<Esc>F", ":lua my_formatter()<CR>", { noremap = true, silent = true })
