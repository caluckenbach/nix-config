{ homebrew-core, homebrew-cask, config, lib, ... }: let
  inherit (lib) enabled;
in {
  homebrew = enabled {
    onActivation = {
      autoUpdate = false;
      cleanup    = "zap";
    };

    # TODO: Periodically check if these become available/fixed in nixpkgs
    brews = [
      "gitui"  # Broken in nixpkgs on aarch64-darwin
    ];

    casks = [
      "figma"
      "ghostty"
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
