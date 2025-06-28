---@alias OnAttachCallback fun(client: vim.lsp.Client, buffer: integer)

local M = {}

---@param on_attach OnAttachCallback
function M.on_attach(on_attach)
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local buffer = args.buf
			local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
			on_attach(client, buffer)
		end,
	})
end

return M
