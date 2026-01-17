{ lib, ... }: let
  inherit (lib) enabled;
in {
  programs.zsh = enabled {
    autosuggestion.enable     = true;
    syntaxHighlighting.enable = true;

    history = {
      size        = 50000;
      save        = 50000;
      ignoreDups  = true;
      ignoreSpace = true;
      share       = true;
      extended    = true;
    };

    sessionVariables = {
      LANG   = "en_US.UTF-8";
      EDITOR = "nvim";
    };

    shellAliases = {
      # File listing (eza)
      ls   = "eza -F --group-directories-first --color=always --icons";
      la   = "eza -alF --group-directories-first --color=always --icons";
      ll   = "eza -lF --group-directories-first";
      lt   = "eza -aTF --level=2 --group-directories-first --icons --color=always";
      tree = "eza --tree";

      # Tools
      cat  = "bat";
      grep = "rg";

      # Safe file operations
      cp = "cp -i";
      mv = "mv -i";
      rm = "rm -i";

      # Neovim
      vim    = "nvim";
      nvimpz = "PUZZLE_MODE=1 nvim";
    };

    initContent = ''
      # Homebrew (if present)
      if [[ -d "/opt/homebrew" ]]; then
        export HOMEBREW_NO_ANALYTICS=1
        export HOMEBREW_NO_ENV_HINTS=1
      fi

      # PATH additions
      typeset -U path
      local path_candidates=(
        "$HOME/.local/bin"
        "$HOME/.cargo/bin"
        "$HOME/.bun/bin"
      )
      for p in "''${path_candidates[@]}"; do
        [[ -d "$p" ]] && path+=("$p")
      done
      export PATH

      # Functions
      ldot() { eza -a | rg "^\." }

      gprn() {
        git fetch --all --prune
        git branch -v | awk '/\[gone\]/ {print $1}' | while read branch; do
          git branch -D "$branch"
        done
      }

      # Load local config if exists
      [[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
    '';
  };

  programs.starship = enabled {
    enableZshIntegration = true;
    settings = {
      command_timeout = 1000;
      memory_usage = {
        disabled  = false;
        format    = "\\[RAM Usage: [\${ram_pct}]($style)\\] ";
        threshold = 80;
        style     = "208";
      };
      lua = {
        format = "using [$symbol]($style) ";
        symbol = "";
      };
    };
  };
}
