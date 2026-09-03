return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      local jdk21 = "/usr/lib/jvm/java-21-openjdk-amd64"
      vim.list_extend(opts.cmd, {
        "--java-executable",
        jdk21 .. "/bin/java",
      })

      opts.settings = vim.tbl_deep_extend("force", opts.settings or {}, {
        java = {
          eclipse = { downloadSources = true },
          maven = { downloadSources = true },
          signatureHelp = { enabled = true },
          contentProvider = { preferred = "fernflower" },
          references = { includeDecompiledSources = true },
          implementationCodeLens = { enabled = true },
          referencesCodeLens = { enabled = true },
          configuration = {
            updateBuildConfiguration = "interactive",
            runtimes = {
              { name = "JavaSE-11", path = "/usr/lib/jvm/java-11-openjdk-amd64" },
              { name = "JavaSE-17", path = "/usr/lib/jvm/java-17-openjdk-amd64" },
              { name = "JavaSE-21", path = jdk21, default = true },
            },
          },
          sources = {
            organizeImports = {
              starThreshold = 9999,
              staticStarThreshold = 9999,
            },
          },
        },
      })

      return opts
    end,
  },
}
