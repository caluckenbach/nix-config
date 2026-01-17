{ lib, ... }: let
  inherit (lib) enabled;
in {
  programs.neovim = enabled {
    defaultEditor = true;
    viAlias       = true;
    vimAlias      = true;
  };
}
