-- Relative numbers for jumping
vim.opt.number = true
vim.opt.relativenumber = true

-- 4 spaces indentations rules
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

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

-- Flutter
vim.api.nvim_create_autocmd("FileType", {
    pattern = "dart",
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.shiftwidth = 2
    end,
})

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Highlight which line your cursor is on
vim.opt.cursorline = true
