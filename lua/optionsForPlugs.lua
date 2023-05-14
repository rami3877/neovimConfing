optionsall = {
	lsp = {
		servers = {
			"bashls",
			"lua_ls",
			"clangd",
			"cmake",
			"rust_analyzer",
			"pyright",
			"jdtls",
			"eslint",
			"openscad_lsp",
		},
		signs = {
			{ name = "DiagnosticSignError", text = "" },
			{ name = "DiagnosticSignWarn", text = "" },
			{ name = "DiagnosticSignHint", text = "" },
			{ name = "DiagnosticSignInfo", text = "" },
		},
		lsp_signature_hint_prefix = "🐿️ ",
	},
	nvimTree = {
		disable_netrw = true,
		hijack_netrw = true,

		open_on_tab = true,
		hijack_cursor = false,
		update_cwd = false,
		diagnostics = {
			enable = false,
			icons = { hint = "", info = "", warning = "", error = "" },
		},
		update_focused_file = { enable = false, update_cwd = false, ignore_list = {} },
		system_open = { cmd = nil, args = {} },
		filters = { dotfiles = false, custom = {} },
		git = { enable = true, ignore = true, timeout = 500 },
		view = {
			width = 10,
			hide_root_folder = false,
			side = "left",
			mappings = { custom_only = false, list = {} },
			number = false,
			relativenumber = false,
			signcolumn = "yes",
		},
		actions = {
			open_file = { resize_window = false },
		},
		trash = { cmd = "trash", require_confirm = true },
	},
}
