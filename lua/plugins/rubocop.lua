return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rubocop = {
          cmd_cwd = "/home/dev-sscrop-1/Documentos/sscrop",
          cmd = {
            "docker-compose",
            "run",
            "--rm",
            "-T",
            "web",
            "bundle",
            "exec",
            "ruby",
            "-rstringio",
            "-S",
            "rubocop",
            "--lsp",
          },
          root_markers = { "Gemfile", ".git", "docker-compose.yml", "docker-compose.yaml" },
        },
      },
    },
  },
}
