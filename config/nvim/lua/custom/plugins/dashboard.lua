return {
    {
        "nvimdev/dashboard-nvim",
        lazy = false,
        priority = 1100,
        --event = "VimEnter",
        --enabled = true,
        opts = function()
            local logo =
[[
____ ____ ____ ____
||A |||S |||W |||F ||
||__|||__|||__|||__||
|/__\|/__\|/__\|/__\|

      ]]

            logo = string.rep("\n", 8) .. logo .. "\n\n"

            local opts = {
                theme = "doom",
                hide = {
                    statusline = false,
                },
                config = {
                    header = vim.split(logo, "\n"),
                    center = {
                        { action = 'lua LazyVim.pick()()',                           desc = " Find file",       icon = "🔎 ", key = "f" },
                        { action = "ene | startinsert",                              desc = " New file",        icon = "🗒️ ", key = "n" },
                        { action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent files",    icon = "📂 ", key = "r" },
                        { action = 'lua LazyVim.pick("live_grep")()',                desc = " Find text",       icon = "📚 ", key = "g" },
                        { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = "⚙️ ", key = "c" },
                        { action = 'lua require("persistence").load()',              desc = " Restore Session", icon = "🪄 ", key = "s" },
                        { action = "LazyExtras",                                     desc = " LazyExtras",      icon = "🗃️ ", key = "x" },
                        { action = "Lazy",                                           desc = " Lazy",            icon = "🔩 ", key = "l" },
                        { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = "🧨 ", key = "q" },
                    },
                    footer = function()
                        local stats = require("lazy").stats()
                        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                        return { "⚡️Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms: " .. "🚀 Have fun with neovim" }
                    end,
                },
            }
            return opts
        end,
    },
}