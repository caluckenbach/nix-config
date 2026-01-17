{
  system.defaults.NSGlobalDomain = {
    AppleShowAllFiles      = true;
    AppleShowAllExtensions = true;

    # Fast key repeat
    InitialKeyRepeat = 15;
    KeyRepeat        = 2;
  };

  system.defaults.dock = {
    autohide     = true;
    showhidden   = true;
    show-recents = false;
    mru-spaces   = false;
    tilesize     = 48;
  };

  system.defaults.finder = {
    AppleShowAllExtensions  = true;
    AppleShowAllFiles       = true;
    FXPreferredViewStyle    = "Nlsv";
    _FXShowPosixPathInTitle = true;
    _FXSortFoldersFirst     = true;
    ShowPathbar             = true;
    ShowStatusBar           = true;
    QuitMenuItem            = true;
  };

  system.defaults.CustomSystemPreferences."com.apple.desktopservices" = {
    DSDontWriteNetworkStores = true;
    DSDontWriteUSBStores     = true;
  };

  system.stateVersion = 6;
}
