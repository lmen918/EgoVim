return {
    --{ -- You can easily change to a different colorscheme.
    --        -- Change the name of the colorscheme plugin below, and then
    --        -- change the command in the config to whatever the name of that colorscheme is.
    --        --
    --        -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    --        'folke/tokyonight.nvim',
    --        priority = 1000, -- Make sure to load this before all the other start plugins.
    --        config = function()
    --          ---@diagnostic disable-next-line: missing-fields
    --          require('tokyonight').setup {
    --            styles = {
    --              comments = { italic = false }, -- Disable italics in comments
    --            },
    --          }
    --
    --          -- Load the colorscheme here.
    --          -- Like many other themes, this one has different styles, and you could load
    --          -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    --          vim.cmd.colorscheme 'tokyonight-night'
    --        end,
    --      },
    {
        "craftzdog/solarized-osaka.nvim",
        branch = "osaka",
        lazy = false,
        priority = 1000,
        opts = function()
            return {
                transparent = true,
            }
        end,
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = true,
        opts = function()
            return {
                terminal_colors = true, -- add neovim terminal colors
                undercurl = true,
                underline = true,
                bold = true,
                italic = {
                    strings = true,
                    emphasis = true,
                    comments = true,
                    operators = false,
                    folds = true,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "", -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = false,
            }
        end
    }
}
