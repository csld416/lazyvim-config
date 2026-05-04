-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Open a terminal
vim.keymap.set("n", "<leader>v", "<cmd>vsplit | terminal<cr>", {
  desc = "Open vertical terminal",-- vertical split
})
vim.keymap.set("n", "<leader>h", "<cmd>split | terminal<cr>", {
  desc = "Open horizontal terminal",-- horizontal split
})

-- Run current file in a new terminal split using /Users/csld/selfScript/run
local function run_current_file(split_cmd)
  local file = vim.fn.expand("%:p")
  if file == "" then
    vim.notify("No current file to run", vim.log.levels.WARN)
    return
  end

  vim.cmd(split_cmd)
  vim.cmd("terminal /Users/csld/selfScript/run " .. vim.fn.shellescape(file))
end

vim.keymap.set("n", "<leader>rv", function()
  run_current_file("vsplit")
end, { desc = "Run current file in vertical terminal" })

vim.keymap.set("n", "<leader>rh", function()
  run_current_file("split")
end, { desc = "Run current file in horizontal terminal" })

-- toggle between buffers in bufferline order
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })

-- move buffer position in bufferline
vim.keymap.set("n", "<A-H>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer left" })
vim.keymap.set("n", "<A-L>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer right" })

-- Close current file buffer without destroying the window layout
vim.keymap.set("n", "<leader>x", function()
  Snacks.bufdelete()
end, { desc = "Close buffer" })

-- Format current file
vim.keymap.set({ "n", "v" }, "<A-S-f>", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format file" })

vim.keymap.set("n", "<A-r>", vim.lsp.buf.rename, {
  desc = "LSP Rename",
})

-- move panes in terminal
vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { desc = "Terminal window left" })
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], { desc = "Terminal window down" })
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], { desc = "Terminal window up" })
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { desc = "Terminal window right" })
-- Helper functions
