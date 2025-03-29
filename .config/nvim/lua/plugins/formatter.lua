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
            bash = { "beautysh" },
            -- You can customize some of the format options for the filetype (:help conform.format)
            -- rust = { "rustfmt", lsp_format = "fallback" },
            -- Conform will run the first available formatter
            -- javascript = { "prettierd", "prettier", stop_after_first = true },
        },
        formatters = {
            stylua = { prepend_args = { "--indent-type", "Spaces" } },
            prettier = { prepend_args = { "--tab-width", 4 } },
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
