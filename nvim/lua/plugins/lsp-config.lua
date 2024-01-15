return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
    },
    {
        "folke/neodev.nvim",
        --        config = function()
        --            require("neodev").setup({
        --                pathStrict = false,
        --                override = function (_, library)
        --                    library.enabled = true
        --                    library.plugins = true
        --                end
        --            })
        --        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("neodev").setup({
                library = { plugins = { "nvim-dap-ui" }, types = true },
            })
            local on_attach = function(_, bufnr)
                -- NOTE: Remember that lua is a real programming language, and as such it is possible
                -- to define small helper and utility functions so you don't have to repeat yourself
                -- many times.
                --
                -- In this case, we create a function that lets us more easily define mappings specific
                -- for LSP related items. It sets the mode, buffer and description for us each time.
                local nmap = function(keys, func, desc)
                    if desc then
                        desc = "LSP: " .. desc
                    end

                    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
                end

                nmap("<leader>clr", vim.lsp.buf.rename, "[R]e[n]ame")
                nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

                nmap("gd", require("telescope.builtin").lsp_definitions, "[G]et [D]efinition")
                nmap("gr", require("telescope.builtin").lsp_references, "[G]et [R]eferences")
                nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
                nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
                nmap("<leader>cls", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
                -- nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

                -- See `:help K` for why this keymap
                nmap("K", vim.lsp.buf.hover, "Hover Documentation")
                nmap("<leader>cd", vim.diagnostic.open_float, "Hover diagnostics")
                -- nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

                -- Lesser used LSP functionality
                nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                -- nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
                -- nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
                -- nmap("<leader>wl", function()
                -- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                -- end, "[W]orkspace [L]ist Folders")
            end

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
            -- lspconfig.lua_ls.setup({
            -- 	capabilities = capabilities,
            -- 	settings = {
            -- 		Lua = {
            -- 			completion = {
            -- 				callSnippet = "Replace",
            -- 			},
            -- 		},
            -- 	},
            -- })
            local servers = {
                -- clangd = {},
                gopls = {},
                nil_ls = {},
                omnisharp = {},
                -- pyright = {},
                -- rust_analyzer = {},
                -- tsserver = {},
                -- html = { filetypes = { 'html', 'twig', 'hbs'} },

                lua_ls = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                        -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                        -- diagnostics = { disable = { 'missing-fields' } },
                    },
                },
            }
            -- Ensure the servers above are installed
            local mason_lspconfig = require("mason-lspconfig")

            mason_lspconfig.setup({
                ensure_installed = vim.tbl_keys(servers),
            })

            mason_lspconfig.setup_handlers({
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                        settings = servers[server_name],
                        filetypes = (servers[server_name] or {}).filetypes,
                    })
                end,
            })
        end,
    },
}
