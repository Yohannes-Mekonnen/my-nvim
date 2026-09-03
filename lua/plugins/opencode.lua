local opencode_cmd = "opencode --port"
local terminal_opts = {
  win = {
    position = "right",
    enter = false,
  },
}

return {
  {
    "NickvanDyke/opencode.nvim",
    version = "*",
    dependencies = {
      "folke/snacks.nvim",
    },
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        server = {
          start = function()
            require("snacks.terminal").open(opencode_cmd, terminal_opts)
          end,
        },
      }
      vim.o.autoread = true
    end,
    keys = {
      {
        "<leader>oa",
        function()
          require("opencode").ask("@this: ")
        end,
        mode = { "n", "x" },
        desc = "Ask OpenCode",
      },
      {
        "<leader>os",
        function()
          require("opencode").select()
        end,
        mode = { "n", "x" },
        desc = "Select OpenCode",
      },
      {
        "<leader>ot",
        function()
          require("snacks.terminal").toggle(opencode_cmd, terminal_opts)
        end,
        mode = { "n", "t" },
        desc = "Toggle OpenCode",
      },
      {
        "<leader>op",
        function()
          require("opencode").prompt("@this")
        end,
        mode = { "n", "x" },
        desc = "Prompt OpenCode with this",
      },
      {
        "go",
        function()
          return require("opencode").operator("@this ")
        end,
        mode = { "n", "x" },
        expr = true,
        desc = "Append range to OpenCode",
      },
      {
        "goo",
        function()
          return require("opencode").operator("@this ") .. "_"
        end,
        mode = "n",
        expr = true,
        desc = "Append line to OpenCode",
      },
    },
  },
}
