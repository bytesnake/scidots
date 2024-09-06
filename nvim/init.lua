require("config.lazy")
require("custom_fns")

 -- set default tab width to four whitespaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- set default theme to light Gruvbox
vim.o.background = "light" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
