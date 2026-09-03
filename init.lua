-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("luasnip.loaders.from_lua").lazy_load({
  paths = { vim.fn.stdpath("config") .. "/lua/snippets" },
})

vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function(args)
    if args.file:match("lua/snippets") then
      require("luasnip").cleanup()
      require("luasnip.loaders.from_lua").lazy_load()
      print("Snippets reloaded")
    end
  end,
})
