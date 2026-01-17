{ config, lib, pkgs, ... }: let
  inherit (lib) mkIf;
in {
  nixpkgs.config.allowUnfree = true;

  # Nix daemon settings only on Linux (Darwin uses Determinate Nix)
  nix = mkIf config.isLinux {
    channel.enable = false;

    gc = {
      automatic  = true;
      options    = "--delete-older-than 7d";
      dates      = "weekly";
      persistent = true;
    };

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operators"
      ];
      trusted-users = [ "root" "@wheel" ];
      warn-dirty    = false;
    };

    optimise.automatic = true;
  };

  environment.systemPackages = with pkgs; [
    nh
  ];
}
