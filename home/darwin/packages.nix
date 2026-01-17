{ pkgs, ... }: {
  home.packages = with pkgs; [
    aerospace
    brave
    claude-code
    raycast
    telegram-desktop
    anki
    zotero
    orbstack
    pinentry_mac
  ];
}
