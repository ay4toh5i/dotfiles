local convertT = {
	denols = "deno",
	vtsls = "tsserver",
}

---@param key string
local function getOptions(key)
	local neoconf = require("neoconf")

	local schemaT = vim.iter({ "", "vscode", "coc", "nlsp" }):map(function(configType)
		return configType == "" and key or ("%s.%s"):format(configType, key)
	end)

	---@type nil|string|table|integer|boolean
	local item = vim.iter(schemaT)
		:map(function(item)
			return neoconf.get(item)
		end)
		:find(function(item)
			return item ~= nil
		end)
end

--@param name string
local function isClientEnable(name)
	name = assert(convertT[name] or name)
	local enable = getOptions(name .. ".enable")
	local disable = getOptions(name .. ".disable")
	if enable == nil and disable == nil then
		return nil
	end

	local isEnable = enable == true or disable == false
	return isEnable
end

return {
  "folke/neoconf.nvim",
  config = function()
    require("neoconf").setup({})
  end,
  isClientEnable = isClientEnable,
  getOptions = getOptions,
}
