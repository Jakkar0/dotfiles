vim.opt.cursorline = true -- Highlight the text line of the cursor.
vim.opt.expandtab = true -- In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
vim.opt.ignorecase = true -- Ignore case in search patterns.
vim.opt.inccommand = "nosplit" -- Shows the effects of :substitute, :smagic, :snomagic and user commands with the :command-preview flag as you type.
vim.opt.number = true -- Print the line number in front of each line.
vim.opt.relativenumber = true -- Show the line number relative to the line with the cursor in front of each line
vim.opt.scrolloff = 7 -- Minimal number of screen lines to keep above and below the cursor.
vim.opt.signcolumn = "yes:1" -- When and how to draw the signcolumn.
vim.opt.smartindent = true -- Do smart autoindenting when starting a new line.
vim.opt.splitbelow = true -- Splitting a window will put the new window below the current one.
vim.opt.splitright = true -- Splitting a window will put the new window right of the current one.

-- disable netrw as recommended by nvimtree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
