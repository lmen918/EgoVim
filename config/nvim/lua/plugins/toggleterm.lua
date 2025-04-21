-- In lua/plugins/web-development.lua or a new file
return {
  {
    "akinsho/toggleterm.nvim",
    opts = {
      open_mapping = [[<c-\>]],
      direction = "float",
    },
    keys = {
      { "<leader>tn", "<cmd>TermExec cmd='npm run dev'<CR>", desc = "Run npm dev" },
      { "<leader>ti", "<cmd>TermExec cmd='npm install'<CR>", desc = "Run npm install" },
      { "<leader>tb", "<cmd>TermExec cmd='npm run build'<CR>", desc = "Run npm build" },
    },
  },
}