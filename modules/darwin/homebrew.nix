{ homebrew-core, homebrew-cask, config, lib, ... }: let
  inherit (lib) enabled;
in {
  homebrew = enabled {
    onActivation = {
      autoUpdate = false;
      cleanup    = "zap";
    };

    brews = [
      "gitui"  # Broken in nixpkgs on aarch64-darwin
    ];

    casks = [
      "figma"
      "protonvpn"
      "raycast"
      "spotify"
      "sublime-text"
      "telegram"
    ];
  };

  nix-homebrew = enabled {
    user = config.system.primaryUser;
    autoMigrate = true;

    taps = {
      "homebrew/homebrew-core" = homebrew-core;
      "homebrew/homebrew-cask" = homebrew-cask;
    };

    mutableTaps = false;
  };
}
