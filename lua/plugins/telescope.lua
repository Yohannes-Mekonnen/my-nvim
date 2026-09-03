return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- remove LazyVim default git_files binding
    { "<leader>fg", false },

    -- assign live_grep instead
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },

    -- move git_files somewhere logical
    { "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
  },
} 
