return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    config = function()
        local harpoon = require("harpoon")
        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():add()
        end, { desc = "Add to harpoon" })
        vim.keymap.set("n", "<C-e>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Toggle harpoon menu" })

        vim.keymap.set("n", "<C-1>", function()
            harpoon:list():select(1)
        end, { desc = "Select the number 1 in harpoon" })
        vim.keymap.set("n", "<C-2>", function()
            harpoon:list():select(2)
        end, { desc = "Select the number 2 in harpoon" })
        vim.keymap.set("n", "<C-3>", function()
            harpoon:list():select(3)
        end, { desc = "Select the number 3 in harpoon" })
        vim.keymap.set("n", "<C-4>", function()
            harpoon:list():select(4)
        end, { desc = "Select the number 4 in harpoon" })

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<leader>w", function()
            harpoon:list():prev()
        end, { desc = "Go to the previous harpoon entry" })
        vim.keymap.set("n", "<leader>q", function()
            harpoon:list():next()
        end, { desc = "Go to the previous harpoon entry" })
    end,
}
