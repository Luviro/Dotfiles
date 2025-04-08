return {
    "stevearc/conform.nvim",
    lazy = false,
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            dart = { "dart_format" },
            toml = { lsp_format = "prefer" },
            python = { "isort", "black" },
            json = { "prettier" },
            jsonc = { "prettier" },
            css = { "prettier" },
            sh = { "beautysh" },
            xml = { "xmlformatter" },
        },
        formatters = {
            stylua = { prepend_args = { "--indent-type", "Spaces" } },
            prettier = { prepend_args = { "--tab-width", 4 } },
            xmlformatter = { prepend_args = { "--indent", 4 } },
        },
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            callback = function(args)
                require("conform").format({ bufnr = args.buf })
            end,
        }),
    },
    keys = {
        {
            -- Customize or remove this keymap to your liking
            "<leader>gf",
            function()
                require("conform").format({ async = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
}
