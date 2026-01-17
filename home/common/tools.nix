{ lib, ... }: let
  inherit (lib) enabled;
in {
  programs.bat = enabled {};

  programs.fzf = enabled {
    enableZshIntegration = true;
  };

  programs.direnv = enabled {
    enableZshIntegration = true;
    nix-direnv.enable    = true;
  };

  programs.zoxide = enabled {
    enableZshIntegration = true;
  };
}
