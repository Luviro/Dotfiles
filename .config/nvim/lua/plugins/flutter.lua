return {
    {
        "nvim-flutter/flutter-tools.nvim",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("telescope").load_extension("flutter")
            vim.keymap.set("n", "<Leader>fc", ":Telescope flutter commands<CR>", { desc = "Flutter commands" })
        end,
    },
    {
        "reisub0/hot-reload.vim",
    },
}
