--
local autopair_status, autopair = pcall(require, "nvim-autopairs")
if not autopair_status then
	return
end

autopair.setup {}
