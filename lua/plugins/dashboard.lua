return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  opts = function(_, opts)
    local logo = [[
	██╗   ██╗   ███╗   ██╗    █████╗     ██████╗    ██╗
	██║   ██║   ████╗  ██║   ██╔══██╗   ██╔════╝    ██║
	██║   ██║ ⬤ ██╔██╗ ██║ ⬤ ███████║ ⬤ ██║  ███╗ ⬤ ██║
	██║   ██║   ██║╚██╗██║   ██╔══██║   ██║   ██║   ██║
	╚██████╔╝   ██║ ╚████║   ██║  ██║   ╚██████╔╝   ██║
	 ╚═════╝    ╚═╝  ╚═══╝   ╚═╝  ╚═╝    ╚═════╝    ╚═╝
    ]] -- ← paste your custom huge ASCII art here (use tools like figlet or patorjk.com/taag)

    logo = string.rep("\n", 5) .. logo .. "\n\n" -- adds vertical padding

    opts.config.header = vim.split(logo, "\n")

    -- Optional: tweak buttons, footer, theme ("doom", "hyper", etc.)
    -- opts.theme = "doom"  -- or "hyper" for different styles
  end,
}
