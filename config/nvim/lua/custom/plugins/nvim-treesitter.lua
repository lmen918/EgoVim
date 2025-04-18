return {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
        if type(opts.ensure_installed) == "table" then
            vim.list_extend(opts.ensure_installed, {
                "javascript",
                "typescript",
                "tsx",
                "html",
                "css",
                "scss",
                "json",
                "vue",
                "svelte",
            })
        end
    end,
}