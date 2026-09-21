{ config, ... }: {
  plugins.treesitter = {
    enable = true;

    settings = {
      auto_install = false;
      highlight.enable = true;
      incremental_selection.enable = true;
    };

    grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
      bash
      c
      caddy
      cpp
      css
      csv
      diff
      dockerfile
      editorconfig
      git_config
      git_rebase
      gitattributes
      gitcommit
      gitignore
      html
      http
      hyprlang
      ini
      json
      json5
      kitty
      lua
      luadoc
      make
      markdown
      markdown_inline
      rust
      scss
      ssh_config
      sql
      toml
      typst
      vim
      vimdoc
      yaml
      zsh
    ];
  };

  plugins.treesitter-context = {
    enable = true;
  };

  plugins.treesitter-textobjects = {
    enable = true;
    settings = {
      select.enable = true;
      swap.enable = true;
    };
  };
}
