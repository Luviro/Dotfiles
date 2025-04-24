return {
    { "williamboman/mason.nvim", opts = {} },
    { "williamboman/mason-lspconfig.nvim", opts = {} },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.dartls.setup({
                capabilities = capabilities,
            })
            lspconfig.taplo.setup({
                capabilities = capabilities,
            })
            lspconfig.pylsp.setup({
                capabilities = capabilities,
            })
            lspconfig.bashls.setup({
                capabilities = capabilities,
            })
            lspconfig.jsonls.setup({
                capabilities = capabilities,
            })
            lspconfig.hyprls.setup({
                capabilities = capabilities,
            })
            lspconfig.vimls.setup({
                capabilities = capabilities,
            })

            -- keybinds
            vim.keymap.set(
                "n",
                "<leader>k",
                vim.lsp.buf.hover,
                { desc = "Displays hover information about the symbol under the cursor in a floating window" }
            )
            vim.keymap.set(
                "n",
                "<leader>d",
                vim.lsp.buf.definition,
                { desc = "Jumps to the definition of the symbol under the cursor" }
            )
            vim.keymap.set(
                "n",
                "<leader>ca",
                vim.lsp.buf.code_action,
                { desc = "Selects a code action available at the current cursor position" }
            )
            vim.keymap.set(
                "n",
                "<leader>r",
                vim.lsp.buf.references,
                { desc = "Lists all the references to the symbol under the cursor in the quickfix window" }
            )

            -- floating window
            vim.o.updatetime = 250
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
                callback = function()
                    vim.diagnostic.open_float(nil, { focus = false })
                end,
            })

            -- borders
            vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]])
            vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])
            local border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
            local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = opts.border or border
                return orig_util_open_floating_preview(contents, syntax, opts, ...)
            end
        end,
    },
}