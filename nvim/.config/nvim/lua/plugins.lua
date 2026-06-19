vim.pack.add({
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/akinsho/toggleterm.nvim" },
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/folke/noice.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
	{ src = "https://github.com/saghen/blink.indent" },
	{ src = "https://github.com/saghen/blink.lib" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/tpope/vim-sleuth" },
	{ src = "https://github.com/xzbdmw/colorful-menu.nvim" },
	-- seems broken atm :(
	--	{ src = "https://github.com/saghen/blink.pairs", version = vim.version.range("*") },
})

----------------
-- catppuccin --
----------------
-- must be early

require("catppuccin").setup({
	flavour = "mocha",
	dim_inactive = {
		enabled = true,
	},
})
vim.cmd.colorscheme("catppuccin-nvim")

-------------
-- conform --
-------------

require("conform").setup({
	formatters = {
		yamlfix = {
			env = {
				YAMLFIX_WHITELINES = "1",
				YAMLFIX_quote_basic_values = "true",
				YAMLFIX_quote_representation = '"',
				YAMLFIX_LINE_LENGTH = "100000", -- dunwrrybootit
				YAMLFIX_SEQUENCE_STYLE = "keep_style",
			},
		},
	},
	formatters_by_ft = {
		go = { "goimports", "gofmt" },
		json = { "jq" },
		lua = { "stylua" },
		python = { "ruff_format", "ruff_organize_imports" },
		sh = { "shfmt" },
		terraform = { "tofu_fmt" },
		yaml = { "yamlfix" },
	},
})

vim.keymap.set("n", "<leader>mp", function()
	if require("conform").format() then
		vim.notify("Ran format with conform on file")
	end
end)

---------------
-- blink.cmp --
---------------

require("blink.cmp").setup({
	default_format_opts = {
		timeout_ms = 3000,
		async = false,
		quiet = false,
		lsp_format = "fallback",
	},
	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 0,
		},
		ghost_text = {
			enabled = true,
		},
		menu = {
			auto_show = false,
			draw = {
				columns = { { "kind_icon" }, { "label", gap = 1 } },
				components = {
					label = {
						text = function(ctx)
							return require("colorful-menu").blink_components_text(ctx)
						end,
						highlight = function(ctx)
							return require("colorful-menu").blink_components_highlight(ctx)
						end,
					},
				},
			},
		},
	},
	fuzzy = { implementation = "prefer_rust_with_warning" },
	keymap = { preset = "default", ["<Tab>"] = { "select_and_accept", "fallback" } },
	signature = { enabled = true },
})

-----------------
-- blink.pairs --
-----------------

-- require("blink.pairs").download():pwait(60000)
-- require("blink.pairs").setup({
-- 	-- required by catppuccin
-- 	highlights = {
-- 		groups = {
-- 			"BlinkPairsRed",
-- 			"BlinkPairsYellow",
-- 			"BlinkPairsBlue",
-- 			"BlinkPairsOrange",
-- 			"BlinkPairsGreen",
-- 			"BlinkPairsPurple",
-- 			"BlinkPairsCyan",
-- 		},
-- 	},
-- })

-------------
-- fzf-lua --
-------------

require("fzf-lua").setup({
	winopts = {
		preview = {
			wrap = true,
		},
	},
	-- seems to be required for catppuccing to apply properly
	fzf_colors = true,
})

vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<CR>")
vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua live_grep<CR>")
vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua lgrep_curbuf<CR>")
vim.keymap.set("n", "<leader>ca", "<cmd>FzfLua lsp_code_actions<CR>")
vim.keymap.set("n", "<leader>sd", "<cmd>FzfLua diagnostics_document<CR>")

--------------
-- gitsigns --
--------------

require("gitsigns").setup({
	current_line_blame = true,
	current_line_blame_opts = { delay = 0 },
})

-------------
-- lualine --
-------------

local function tmux_status()
	if vim.env.TMUX then
		return "tmux: ✓"
	else
		return "tmux: ✗"
	end
end

require("lualine").setup({
	options = {
		globalstatus = true,
	},
	sections = {
		lualine_x = { tmux_status },
		lualine_y = { "filetype" },
		lualine_z = { "progress", "location" },
	},
})

-----------
-- mason --
-----------

require("mason").setup()

---------------------
-- mason-lspconfig --
---------------------

require("mason-lspconfig").setup()

--------------------------
-- mason-tool-installer --
--------------------------

require("mason-tool-installer").setup({
	ensure_installed = {
		"ansible-language-server",
		"ansible-lint",
		"bashls",
		"goimports",
		"gopls",
		"jq",
		"json-lsp",
		"jq",
		"lua-language-server",
		"ruff",
		"shfmt",
		"stylua",
		"tofu-ls",
		"ty",
		"yamlfix",
		"yamlls",
		"rust-analyzer",
	},
})

---------------
-- nvim-tree --
---------------

require("nvim-tree").setup({
	filters = {
		enable = false,
	},
	modified = {
		enable = true,
		show_on_open_dirs = false,
	},
	view = {
		float = {
			enable = true,
		},
	},
	on_attach = function(bufnr)
		local api = require("nvim-tree.api")
		local function opts(desc)
			return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end

		api.map.on_attach.default(bufnr)

		vim.keymap.set("n", "<Esc>", api.tree.close, opts("Close"))
	end,
})

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")

-----------
-- noice --
-----------

require("noice").setup({})

vim.keymap.set("n", "<leader>nf", "<cmd>Noice fzf<CR>")

----------------
-- toggleterm --
----------------

require("toggleterm").setup({
	auto_scroll = false,
	size = function(term)
		if term.direction == "horizontal" then
			return vim.o.lines * 0.3
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,
	shade_terminals = false,
	start_in_insert = false,
	on_open = function(term)
		-- fix width/height so neovim doesn't try to auto resize the terminals
		if term.direction == "vertical" then
			vim.wo[term.window].winfixwidth = true
		elseif term.direction == "horizontal" then
			vim.wo[term.window].winfixheight = true
		else
			return -- float, nothing to balance
		end

		-- automatically balance out all other panes when termianal opens
		vim.cmd("wincmd =")
	end,
})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
local floaty = Terminal:new({ hidden = true, direction = "float" })

function Lazygit_toggle()
	lazygit:toggle()
end

function Floaty_toggle()
	floaty:toggle()
end

-- find the curently open terminal dock if there is any
local function find_open_dock()
	for _, term in pairs(require("toggleterm.terminal").get_all(true)) do
		if term:is_open() and (term.direction == "horizontal" or term.direction == "vertical") then
			return term
		end
	end
end

-- toggle/open dock, and block if trying to open terminal that's "wrong" for current dock
local function dock(cmd, direction)
	local open = find_open_dock()
	if open and open.direction ~= direction then
		vim.notify(
			("A %s terminal dock is open - close it before opening a %s one."):format(open.direction, direction),
			vim.log.levels.WARN
		)
		return
	end
	vim.cmd(cmd .. " direction=" .. direction)
end

vim.keymap.set("n", "<leader>tg", function()
	dock("ToggleTerm", "horizontal")
end)
vim.keymap.set("n", "<leader>tr", function()
	dock("ToggleTerm", "vertical")
end)
vim.keymap.set("n", "<leader>tng", function()
	dock("TermNew", "horizontal")
end)
vim.keymap.set("n", "<leader>tnr", function()
	dock("TermNew", "vertical")
end)
vim.keymap.set("n", "<leader>tt", "<cmd>lua Floaty_toggle()<CR>")
vim.keymap.set("n", "<leader>g", "<cmd>lua Lazygit_toggle()<CR>")
