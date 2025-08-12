-- lua/plugins/lsp.lua

return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        build = ":MasonUpdate",
        opts = {
            ui = {
                icons = {
                    package_installed   = "✓",
                    package_pending     = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
        },
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            ensure_installed = { "lua_ls", "clangd" },
            automatic_installation = true,
            handlers = {
                -- 기본 핸들러: 설치된 서버에 대해 자동 설정
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = require("cmp_nvim_lsp").default_capabilities(),
                    })
                end,

                -- clangd 전용 설정
                clangd = function()
                    require("lspconfig").clangd.setup({
                        capabilities = require("cmp_nvim_lsp").default_capabilities(),
                        cmd = {
                            "clangd",
                            "--background-index",
                            "--clang-tidy",
                            "--header-insertion=iwyu",
                        },
                        init_options = {
                            fallbackFlags = { "-std=c17" },
                        },
                        filetypes = { "c", "cpp", "objc", "objcpp" },
                        root_dir = function(fname)
                            return lspconfig.util.root_pattern("compile_commands.json", ".git", "ProcessorExpert.pe")(
                                fname)
                                or lspconfig.util.find_git_ancestor(fname)
                                or vim.fn.getcwd()
                        end,
                    })
                end,
                -- lua_ls 전용 설정
                lua_ls = function()
                    require("lspconfig").lua_ls.setup({
                        capabilities = require("cmp_nvim_lsp").default_capabilities(),
                        settings = {
                            Lua = {
                                runtime = { version = "LuaJIT" },
                                diagnostics = { globals = { "vim" } },
                                workspace = {
                                    library = vim.api.nvim_get_runtime_file("", true),
                                    checkThirdParty = false,
                                },
                                telemetry = { enable = false },
                            },
                        },
                    })
                end,
            },
        },
        config = function(_, opts)
            require("mason-lspconfig").setup(opts)
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "hrsh7th/cmp-nvim-lsp" },
        config = function()
            -- 버퍼 전용 키맵
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    local buf = ev.buf
                    local opts = { buffer = buf, silent = true }

                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "<space>f", function()
                        vim.lsp.buf.format({ async = true })
                    end, opts)
                end,
            })

            -- 전역 fallback 키맵 (버퍼 매핑 누락 대비)
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { desc = "LSP: Go to definition" })
            vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, { desc = "LSP: Find references" })

            -- 진단 설정
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            })

            -- 진단 표시 아이콘
            for type, icon in pairs({ Error = " ", Warn = " ", Hint = " ", Info = " " }) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end
        end,
    },
}
