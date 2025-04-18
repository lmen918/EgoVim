return {
    {
        "neovim/nvim-lspconfig",
        ---@class PluginLspOpts
        cmd = { "LspConfig", "LspInstall", "LspUninstall" },
        opts = {
            -- Make sure to install the appropriate LSPs
            -- e.g., for TypeScript: npm install -g typescript typescript-language-server
            autoformat = true,
            servers = {
                -- For TypeScript/JavaScript
                tsserver = {
                    settings = {
                        typescript = {
                            inlayHints = {
                                includeInlayParameterNameHints = "all",
                                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                                includeInlayFunctionParameterTypeHints = true,
                                includeInlayVariableTypeHints = true,
                                includeInlayPropertyDeclarationTypeHints = true,
                                includeInlayFunctionLikeReturnTypeHints = true,
                                includeInlayEnumMemberValueHints = true,
                            },
                            suggestionActions = { enabled = true },
                            implementationsCodeLens = { enabled = true },
                            referencesCodeLens = { enabled = true },
                            preferences = {
                                importModuleSpecifier = "relative",
                            },
                        },
                        javascript = {
                            inlayHints = {
                                includeInlayParameterNameHints = "all",
                                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                                includeInlayFunctionParameterTypeHints = true,
                                includeInlayVariableTypeHints = true,
                                includeInlayPropertyDeclarationTypeHints = true,
                                includeInlayFunctionLikeReturnTypeHints = true,
                                includeInlayEnumMemberValueHints = true,
                            },
                            suggestionActions = { enabled = true },
                            preferences = {
                                importModuleSpecifier = "relative",
                            },
                        },
                    },
                },
                -- Add other language servers as needed
                -- pyright = {}, -- For Python
                -- rust_analyzer = {}, -- For Rust
                -- gopls = {}, -- For Go
                html = { enabled = true },
                cssls = { enabled = true },
                tailwindcss = { enabled = true },
                eslint = { enabled = true },
                -- Enable auto import suggestions
                init_options = {
                    preferences = {
                        importModuleSpecifierPreference = "relative",
                        includeCompletionsForModuleExports = true,
                    },
                },
            },
        },
    },
    -- Add nvim-cmp configuration for better completion experience
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
        opts = function(_, opts)
            local cmp = require("cmp")
            opts.mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
                ["<Tab>"] = cmp.mapping.select_next_item(),
                ["<S-Tab>"] = cmp.mapping.select_prev_item(),
            })
            return opts
        end,
    },
}
