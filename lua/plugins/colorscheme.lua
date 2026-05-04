-- lua/plugins/colorscheme.lua
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = false,
      integrations = {
        telescope = false,
      },
      on_colors = function(colors)
        colors.bg = "#1e1e1e"
        colors.bg_dark = "#1e1e1e"
        colors.bg_float = "#1e1e1e"
        colors.bg_sidebar = "#252526"
        colors.crust = "#1e1e1e"
        colors.mantle = "#1e1e1e"
        colors.surface0 = "#252526"
        colors.surface1 = "#2d2d30"
        colors.surface2 = "#3e3e42"
      end,
      custom_highlights = function(colors)
        return {
          Normal = { bg = colors.bg },
          NormalNC = { bg = colors.bg },
          NormalFloat = { bg = colors.bg_float },
          FloatBorder = { bg = colors.bg_float, fg = colors.blue },
          WinSeparator = { bg = colors.bg, fg = colors.surface2 },
        }
      end,
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")

      require("config.highlights").apply()

      vim.api.nvim_create_autocmd({
        "ColorScheme",
        "VimEnter",
        "WinEnter",
        "WinNew",
        "BufEnter",
        "BufWinEnter",
        "FileType",
      }, {
        callback = function()
          vim.schedule(function()
            require("config.highlights").apply()
          end)
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = { "VeryLazy", "TelescopeFindPre", "SnacksPicker" },
        callback = function()
          vim.schedule(function()
            require("config.highlights").apply()
          end)
        end,
      })
    end,
  },
}