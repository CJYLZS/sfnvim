local options = {
	number = true,
	relativenumber = true,
	-- paste = true, -- set true will effect nvim-cmp enter completion
	shiftwidth = 4,
	tabstop = 4,
	softtabstop = 4,
	smarttab = true,
	expandtab = true,
}
for key, value in pairs(options) do
	vim.o[key] = value
end
