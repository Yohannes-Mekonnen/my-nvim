return {
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod" },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" } },
    },
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    keys = {
      { "<leader>db", "<cmd>DBUI<cr>", desc = "Open Dadbod UI" },
    },
    init = function()
      local data = vim.fn.expand("~/.local/share/db_ui")
      local tmp = vim.fn.expand("~/.cache/db_ui")
      vim.fn.mkdir(data, "p")
      vim.fn.mkdir(tmp, "p")

      local cfg_bin = vim.fn.stdpath("config") .. "/bin"
      local sqlcl_bin = vim.fn.expand("~/oracle/sqlcl/bin")
      vim.env.PATH = cfg_bin .. ":" .. sqlcl_bin .. ":" .. vim.env.PATH

      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_save_location = data
      vim.g.db_ui_tmp_query_location = tmp
      vim.g.db_ui_execute_on_save = false
      vim.g.db_ui_use_nvim_notify = false
      vim.g.db_ui_auto_execute_table_helpers = 1
      vim.g.dbext_default_ORA_bin = "sqlcl"
    end,
  },
}
