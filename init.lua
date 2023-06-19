require("vincent_perez.plugins-setup")
require("vincent_perez.core.options")
require("vincent_perez.core.keymaps")
require("vincent_perez.core.colorscheme")
require("vincent_perez.plugins.comment")
require("vincent_perez.plugins.nvim-tree")
require("vincent_perez.plugins.lualine")
require("vincent_perez.plugins.telescope")
require("vincent_perez.plugins.nvim-cmp")
require("vincent_perez.plugins.lsp.mason")
require("vincent_perez.plugins.lsp.lspsaga")
require("vincent_perez.plugins.lsp.lspconfig")
require("vincent_perez.plugins.lsp.null-ls")
require("vincent_perez.plugins.autopairs")
require("vincent_perez.plugins.treesitter")
require("vincent_perez.plugins.gitsigns")
require("vincent_perez.plugins.whichkey")

-- init.lua

-- Load custom treesitter grammar for org filetype
require("orgmode").setup_ts_grammar()

-- Treesitter configuration
require("nvim-treesitter.configs").setup({
	-- If TS highlights are not enabled at all, or disabled via `disable` prop,
	-- highlighting will fallback to default Vim syntax highlighting
	highlight = {
		enable = true,
		-- Required for spellcheck, some LaTex highlights and
		-- code block highlights that do not have ts grammar
		additional_vim_regex_highlighting = { "org" },
	},
	ensure_installed = { "org" }, -- Or run :TSUpdate org
})

require("orgmode").setup({
	org_agenda_files = { "~/Dropbox/org/*", "~/my-orgs/**/*" },
	org_default_notes_file = "~/Dropbox/org/refile.org",
})

-- setup must be called before loading the colorscheme
-- Default options:
require("gruvbox").setup({
	undercurl = true,
	underline = true,
	bold = true,
	italic = {
		strings = true,
		comments = true,
		operators = false,
		folds = true,
	},
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = true, -- invert background for search, diffs, statuslines and errors
	contrast = "", -- can be "hard", "soft" or empty string
	palette_overrides = {},
	overrides = {},
	dim_inactive = false,
	transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")
