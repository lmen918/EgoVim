-- Existing LazyVim keymaps are preserved
local map = vim.keymap.set

-- Web development keybindings
-- Format current file with Prettier
map("n", "<leader>fp", function()
  require("conform").format({ formatters = { "prettier" } })
end, { desc = "Format with Prettier" })

-- REST client
map("n", "<leader>rr", "<Plug>RestNvim", { desc = "Run REST Request" })
map("n", "<leader>rp", "<Plug>RestNvimPreview", { desc = "Preview REST Request" })

-- Database UI toggle
map("n", "<leader>db", "<cmd>DBUIToggle<CR>", { desc = "Toggle DB UI" })

-- Toggle live server (if you have a live server plugin)
map("n", "<leader>ls", "<cmd>LiveServerStart<CR>", { desc = "Start Live Server" })
map("n", "<leader>lS", "<cmd>LiveServerStop<CR>", { desc = "Stop Live Server" })

-- lspimport
--vim.keymap.set("n", "<leader>a", require("lspimport").import, { noremap = true })

-- Add keymaps after Neovim has loaded
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings
    local opts = { buffer = ev.buf }

    -- Code actions (includes import suggestions)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

    -- Organize imports for TypeScript/JavaScript
    vim.keymap.set("n", "<leader>co", function()
      vim.lsp.buf.execute_command({
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
      })
    end, { desc = "Organize Imports", buffer = ev.buf })
  end,
})