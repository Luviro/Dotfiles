-- Relative numbers for jumping
vim.opt.number = true
vim.opt.relativenumber = true

-- indentations rules are set by .editorconfig

-- Searching
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Minimum number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 8

-- leaders
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Since there is already a status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Highlight which line your cursor is on
vim.opt.cursorline = true
