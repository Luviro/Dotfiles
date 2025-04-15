return {
    "tpope/vim-fugitive",
    keys = {
        {
            -- Customize or remove this keymap to your liking
            "<leader>gs",
            function()
                vim.cmd.Git()
            end,
            mode = "n",
        },
    },
}
