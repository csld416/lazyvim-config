-- ~/.config/nvim-lazyvim/lua/plugins/verible.lua
return {{
    "neovim/nvim-lspconfig",
    opts = {
        servers = {
            verible = {
                cmd = {"verible-verilog-ls"},
                filetypes = {"verilog", "systemverilog"},
                root_markers = {".git", "verible.filelist", "compile_commands.json"},
                root_dir = function(bufnr, on_dir)
                    local fname = vim.api.nvim_buf_get_name(bufnr)
                    local root = vim.fs.root(fname, {".git", "verible.filelist", "compile_commands.json"}) or
                                     vim.fn.getcwd()
                    on_dir(root)
                end,
                handlers = {
                    ["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
                        if result and result.diagnostics then
                            result.diagnostics = vim.tbl_filter(function(d)
                                return d.severity == vim.diagnostic.severity.ERROR
                            end, result.diagnostics)
                        end
                        vim.lsp.handlers["textDocument/publishDiagnostics"](err, result, ctx, config)
                    end
                }
            }
        }
    }
}}
