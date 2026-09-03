return {
  { "tpope/vim-dadbod", lazy = true },

  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "plsql" }, lazy = true }
    },
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    keys = {
      { "<leader>db", "<cmd>DBUI<cr>", desc = "Open Dadbod UI" },
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_save_location = "~/.local/share/db_ui"
      vim.g.db_ui_tmp_dir = "~/.cache/db_ui"
      vim.g.db_ui_show_schemas = false
      vim.g.dbext_default_ORA_bin = "sql"
      vim.g.dbext_default_ORA_cmd = "sql-S -L"
    end,
  },
}
