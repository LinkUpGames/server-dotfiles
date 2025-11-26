return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			---@module "nutt.plugins.code.nvim-lspconfig"
			---@type table<string, LspServerConfig>
			servers = {
				yamlls = {
					filetypes = { "yaml", "yaml.ansible" },
				},
				ansiblels = {
					filetypes = { "yaml", "yaml.ansible" },
				},
			},
		},
	},
}
