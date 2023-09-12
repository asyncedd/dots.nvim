local opt = vim.opt

local options = {
	-- @type boolean
	number = true,
	-- @type boolean
	relativenumber = true
}

for k, v in pairs(options) do
	opt[k] = v
end
