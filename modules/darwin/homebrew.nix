{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      cleanup    = "zap";  # Remove unlisted casks/formulae
    };

    global.brewfile = true;

    brews = [
      "gitui"  # Broken in nixpkgs on aarch64-darwin
    ];

    casks = [
      "figma"
      "protonvpn"
      "sublime-text"
    ];
  };
}
