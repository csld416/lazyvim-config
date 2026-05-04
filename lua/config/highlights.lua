-- lua/config/highlights.lua
local M = {}

function M.apply()
    local bg = "#1e1e1e"
    local sidebar = "#252526"
    local selection = "#2d2d30"
    local border = "#3e3e42"
    local fg = "#d4d4d4"
    local blue = "#89b4fa"
    local peach = "#fab387"
    local gray = "#7f849c"

    local function hi(group, opts)
        vim.api.nvim_set_hl(0, group, opts)
    end

    -- Treesitter / syntax colors
    hi("@comment", {
        fg = "#6a9955"
    })

    -- C/C++
    hi("@keyword.directive.define.c", {
        fg = "#569dd6"
    })
    hi("@keyword.directive.c", {
        fg = "#65b6f8"
    })
    hi("@keyword.import.c", {
        fg = "#d68dd0"
    })
    hi("@keyword.repeat.c", {
        fg = "#c192ed"
    })
    hi("@keyword.return.c", {
        fg = "#d182ca"
    })
    hi("@string.c", {
        fg = "#ffc979"
    })
    hi("@constant.macro.c", {
        fg = "#ef9d29"
    })
    hi("@function.call.c", {
        fg = "#ecc185"
    })
    hi("@type.builtin.c", {
        fg = "#60b2f5"
    })
    hi("@type.definition.c", {
        fg = "#4fcab0"
    })
    hi("@type.c", {
        fg = "#4fcab0"
    })
    hi("@property.c", {
        fg = "#ffba53"
    })
    hi("@constant.c", {
        fg = "#eda8f5"
    })
    hi("@variable.c", {
        fg = "#e1b3b3"
    })

    -- Python
    hi("@keyword.import.python", {
        fg = "#e89fe2"
    })
    hi("@type.python", {
        fg = "#53d8be"
    })

    -- Verilog / SystemVerilog
    hi("@type.builtin.systemverilog", {
        fg = "#dbb7ff"
    })
    hi("@module.systemverilog", {
        fg = "#4fcab0"
    })
    hi("@keyword.systemverilog", {
        fg = "#ddb1ff"
    })
    hi("@variable.member.systemverilog", {
        fg = "#ffe3c4"
    })
    hi("@constructor.systemverilog", {
        fg = "#ffdc3f"
    })
    hi("@variable.systemverilog", {
        fg = "#abdefa"
    })

    -- Core UI
    hi("Normal", {
        fg = fg,
        bg = bg
    })
    hi("NormalNC", {
        fg = fg,
        bg = bg
    })
    hi("NormalFloat", {
        fg = fg,
        bg = bg
    })
    hi("FloatBorder", {
        fg = blue,
        bg = bg
    })
    hi("WinSeparator", {
        fg = border,
        bg = bg
    })
    hi("Pmenu", {
        fg = fg,
        bg = bg
    })
    hi("PmenuSel", {
        fg = fg,
        bg = selection
    })

    hi("SignColumn", {
        bg = bg
    })
    hi("LineNr", {
        bg = bg
    })
    hi("CursorLine", {
        bg = "#2a2d3e"
    })
    hi("CursorLineNr", {
        bg = "#2a2d3e"
    })
    hi("FoldColumn", {
        bg = bg
    })
    hi("EndOfBuffer", {
        bg = bg
    })

    -- Telescope
    hi("TelescopeNormal", {
        fg = fg,
        bg = bg
    })
    hi("TelescopeBorder", {
        fg = blue,
        bg = bg
    })
    hi("TelescopePromptNormal", {
        fg = fg,
        bg = bg
    })
    hi("TelescopePromptBorder", {
        fg = peach,
        bg = bg
    })
    hi("TelescopePromptTitle", {
        fg = peach,
        bg = bg
    })
    hi("TelescopePromptPrefix", {
        fg = blue,
        bg = bg
    })
    hi("TelescopePromptCounter", {
        fg = gray,
        bg = bg
    })
    hi("TelescopeResultsNormal", {
        fg = fg,
        bg = bg
    })
    hi("TelescopeResultsBorder", {
        fg = blue,
        bg = bg
    })
    hi("TelescopeResultsTitle", {
        fg = blue,
        bg = bg
    })
    hi("TelescopePreviewNormal", {
        fg = fg,
        bg = bg
    })
    hi("TelescopePreviewBorder", {
        fg = blue,
        bg = bg
    })
    hi("TelescopePreviewTitle", {
        fg = blue,
        bg = bg
    })
    hi("TelescopeSelection", {
        fg = fg,
        bg = selection
    })
    hi("TelescopeSelectionCaret", {
        fg = blue,
        bg = selection
    })
    hi("TelescopeMatching", {
        fg = blue,
        bg = bg
    })

    -- Picker aliases
    hi("PickerNormal", {
        fg = fg,
        bg = bg
    })
    hi("PickerBorder", {
        fg = blue,
        bg = bg
    })
    hi("PickerTitle", {
        fg = blue,
        bg = bg
    })
    hi("PickerPrompt", {
        fg = fg,
        bg = bg
    })
    hi("PickerPreview", {
        fg = fg,
        bg = bg
    })
    hi("PickerResults", {
        fg = fg,
        bg = bg
    })
    hi("PickerSelection", {
        fg = fg,
        bg = selection
    })
    hi("PickerMatch", {
        fg = blue,
        bg = bg
    })

    -- Noice / cmdline popups
    hi("WhichKeyNormal", {
        fg = fg,
        bg = bg
    })
    hi("NoiceCmdlinePopup", {
        fg = fg,
        bg = bg
    })
    hi("NoiceCmdlinePopupBorder", {
        fg = blue,
        bg = bg
    })
    hi("NoiceCmdlinePopupTitle", {
        fg = blue,
        bg = bg
    })

    -- Snacks picker
    hi("SnacksPicker", {
        fg = fg,
        bg = bg
    })
    hi("SnacksPickerNormal", {
        fg = fg,
        bg = bg
    })
    hi("SnacksPickerNormalNC", {
        fg = fg,
        bg = bg
    })
    hi("SnacksPickerInput", {
        fg = fg,
        bg = bg
    })
    hi("SnacksPickerInputSearch", {
        fg = fg,
        bg = bg
    })
    hi("SnacksPickerList", {
        fg = fg,
        bg = sidebar
    })
    hi("SnacksPickerPreview", {
        fg = fg,
        bg = bg
    })
    hi("SnacksPickerBox", {
        fg = fg,
        bg = bg
    })
    hi("SnacksPickerWin", {
        fg = fg,
        bg = bg
    })

    hi("SnacksPickerBorder", {
        fg = blue,
        bg = bg
    })
    hi("SnacksPickerInputBorder", {
        fg = peach,
        bg = bg
    })
    hi("SnacksPickerListBorder", {
        fg = blue,
        bg = sidebar
    })
    hi("SnacksPickerPreviewBorder", {
        fg = blue,
        bg = bg
    })
    hi("SnacksPickerTitle", {
        fg = blue,
        bg = bg
    })
    hi("SnacksPickerInputTitle", {
        fg = peach,
        bg = bg
    })
    hi("SnacksPickerListTitle", {
        fg = fg,
        bg = sidebar
    })
    hi("SnacksPickerListFooter", {
        fg = gray,
        bg = sidebar
    })
    hi("SnacksPickerBackdrop", {
        bg = bg
    })
    hi("SnacksPickerInputCursorLine", {
        bg = selection
    })
    hi("SnacksPickerListCursorLine", {
        bg = selection
    })
    hi("SnacksPickerPreviewCursorLine", {
        bg = selection
    })

    hi("SnacksPickerMatch", {
        fg = blue,
        bg = bg
    })
    hi("SnacksPickerDir", {
        fg = blue,
        bg = bg
    })
    hi("SnacksPickerFile", {
        fg = fg,
        bg = bg
    })
    hi("SnacksPickerPrompt", {
        fg = blue,
        bg = bg
    })
    hi("SnacksPickerSelected", {
        fg = fg,
        bg = selection
    })
    hi("SnacksPickerToggle", {
        fg = peach,
        bg = bg
    })
    hi("SnacksPickerDimmed", {
        fg = gray,
        bg = bg
    })
    hi("SnacksPickerDesc", {
        fg = gray,
        bg = bg
    })
    hi("SnacksPickerIcon", {
        fg = blue,
        bg = bg
    })
    hi("SnacksPickerGitStatus", {
        fg = gray,
        bg = bg
    })
    hi("SnacksPickerPathHidden", {
        fg = gray,
        bg = bg
    })
    hi("SnacksPickerPathIgnored", {
        fg = gray,
        bg = bg
    })

    -- Generic Snacks windows
    hi("SnacksNormal", {
        fg = fg,
        bg = sidebar
    })
    hi("SnacksNormalNC", {
        fg = fg,
        bg = sidebar
    })
    hi("SnacksWin", {
        fg = fg,
        bg = sidebar
    })
    hi("SnacksWinBar", {
        fg = blue,
        bg = sidebar
    })
    hi("SnacksBackdrop", {
        bg = bg
    })

    -- Sidebars / explorers
    hi("NeoTreeNormal", {
        fg = fg,
        bg = sidebar
    })
    hi("NeoTreeNormalNC", {
        fg = fg,
        bg = sidebar
    })
    hi("SnacksExplorerNormal", {
        fg = fg,
        bg = sidebar
    })
    hi("SnacksExplorerNormalNC", {
        fg = fg,
        bg = sidebar
    })
    hi("SnacksExplorerWinBar", {
        fg = fg,
        bg = sidebar
    })
    hi("SnacksExplorerTitle", {
        fg = fg,
        bg = sidebar
    })
    hi("SnacksExplorerBorder", {
        fg = border,
        bg = sidebar
    })
end

return M
