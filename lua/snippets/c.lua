-- ~/.config/nvim-lazyvim/lua/snippets/c.lua

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
  s("mainc", {
    t({
      '#pragma GCC optimize("O2")',
      "#include <limits.h>",
      "#include <math.h>",
      "#include <stdio.h>",
      "#include <stdlib.h>",
      "#include <string.h>",
      "",
      "int main() {",
      "    int n;",
      "    return 0;",
      "}",
    }),
  }),
}