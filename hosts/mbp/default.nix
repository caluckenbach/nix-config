lib: lib.darwinSystem' ({ config, lib, pkgs, ... }: {
  type = "desktop";

  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  # Determinate Nix manages the daemon
  nix.enable = false;

  networking.hostName = "mbp";

  system.primaryUser = "cal";

  users.users.cal = {
    name = "cal";
    home = "/Users/cal";
  };

  home-manager.users.cal = {
    home = {
      username      = "cal";
      homeDirectory = "/Users/cal";
      stateVersion  = "25.11";
    };

    programs.home-manager.enable = true;
  };
})
