-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.spell = false
vim.diagnostic.config({
    virtual_text = {
        severity = vim.diagnostic.severity.ERROR
    },
    signs = {
        severity = vim.diagnostic.severity.ERROR
    },
    underline = {
        severity = vim.diagnostic.severity.ERROR
    },
    float = {
        severity = vim.diagnostic.severity.ERROR
    }
})

vim.opt.tabstop = 4 -- how wide a real tab character looks
vim.opt.shiftwidth = 4 -- indent size when using >>, <<, autoindent
vim.opt.softtabstop = 4 -- tab/backspace behavior in insert mode
vim.opt.expandtab = true -- use spaces instead of real tab characters
