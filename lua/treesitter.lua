require'nvim-treesitter.configs'.setup {
	ensure_installed = { "cpp", "c" },
	highlight = { enable = true },
	incremental_selection = { enable = true },
	textobjects = { enable = true },
}