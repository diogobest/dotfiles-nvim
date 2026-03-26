return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rubocop = {
          root_dir = function(fname)
            local root = require("lspconfig.util").root_pattern("Gemfile", ".git", "docker-compose.yml", "docker-compose.yaml")(fname)
            return root or "/home/dev-sscrop-1/Documentos/sscrop"
          end,
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
          single_file_support = false,
        },
      },
    },
  },
}
