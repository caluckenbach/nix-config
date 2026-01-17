{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      cleanup    = "zap";  # Remove unlisted casks/formulae
    };

    global.brewfile = true;

    casks = [
      "figma"
      "protonvpn"
      "sublime-text"
    ];

  };
}
