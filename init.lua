require("auto-commands");
require("lazy-bootstrap")
require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	checker = { enabled = true },
	"plugins",
})
