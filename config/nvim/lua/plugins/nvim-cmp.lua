return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        }),
      })
      opts.completion = {
        completeopt = "menu,menuone,noinsert",
      }
      return opts
    end,
  },

  -- Add null-ls for code actions including imports
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local null_ls = require("null-ls")
      return {
        sources = {
          -- For TypeScript/JavaScript
          null_ls.builtins.code_actions.eslint,
          -- For Python
          -- null_ls.builtins.code_actions.pyright,
          -- Add other sources as needed
        },
      }
    end,
  },
}