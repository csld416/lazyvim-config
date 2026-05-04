-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- update configurations, source all the files under ~/.config/nvim/lua/config/ and then re-compile lazyvim

local function apply_custom_highlights()
    vim.schedule(function()
        require("config.highlights").apply()
    end)
end

vim.api.nvim_create_autocmd({
    "ColorScheme",
    "VimEnter",
    "WinEnter",
    "WinNew",
    "BufEnter",
    "BufWinEnter",
    "FileType",
}, {
    callback = apply_custom_highlights,
})

vim.api.nvim_create_autocmd("User", {
    pattern = {
        "VeryLazy",
        "LazyVimStarted",
        "TelescopeFindPre",
        "SnacksPicker",
        "SnacksPickerOpen",
        "SnacksExplorerOpen",
    },
    callback = apply_custom_highlights,
})

-- apply once immediately for the current colorscheme during startup/source
apply_custom_highlights()

vim.filetype.add({
    extension = {
        v = "systemverilog",
        sv = "systemverilog",
        svh = "systemverilog"
    }
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"verilog", "systemverilog"},
    callback = function(args)
        -- Disable legacy Vim syntax groups like verilogStatement
        vim.bo[args.buf].syntax = "off"
        -- Force Tree-sitter highlighter on this buffer
        pcall(vim.treesitter.start, args.buf, "systemverilog")
    end
})

vim.api.nvim_create_autocmd({ "VimEnter", "LspAttach", "BufEnter" }, {
  callback = function()
    vim.schedule(function()
      vim.diagnostic.config({
        virtual_text = {
          severity = { min = vim.diagnostic.severity.ERROR },
        },
        signs = {
          severity = { min = vim.diagnostic.severity.ERROR },
        },
        underline = {
          severity = { min = vim.diagnostic.severity.ERROR },
        },
        float = {
          severity = { min = vim.diagnostic.severity.ERROR },
        },
        severity_sort = true,
        update_in_insert = false,
      })
    end)
  end,
})

-- Alias
vim.api.nvim_create_user_command("Dashboard", function()
    vim.cmd("tabnew")
    pcall(vim.cmd, "only")
    vim.schedule(function()
        Snacks.dashboard()
    end)
end, {})

vim.api.nvim_create_user_command("Reloadcmd", function()
    vim.cmd("source ~/.config/nvim-lazyvim/lua/config/autocmds.lua")
    require("config.highlights").apply()
end, {})

vim.api.nvim_create_user_command("Reloadkeymap", function()
    vim.cmd("source ~/.config/nvim-lazyvim/lua/config/keymaps.lua")
end, {})

vim.api.nvim_create_user_command("LspKill", function()
    for _, client in pairs(vim.lsp.get_clients()) do
        client.stop(true)
    end
end, {})

vim.api.nvim_create_user_command("Rename", function()
  vim.lsp.buf.rename()
end, {})

vim.api.nvim_create_user_command("ReloadPlugin", function()
    local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"
    local files = vim.fn.glob(plugin_dir .. "/*.lua", false, true)
    for _, file in ipairs(files) do
        dofile(file)
        vim.notify("Reloaded: " .. file, vim.log.levels.INFO)
    end
end, {})

vim.api.nvim_create_user_command("ReloadConfig", function()
    local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"
    local files = vim.fn.glob(plugin_dir .. "/*.lua", false, true)
    for _, file in ipairs(files) do
        dofile(file)
        vim.notify("Reloaded: " .. file, vim.log.levels.INFO)
    end
end, {})