{ pkgs, ... }: {
  home.packages = with pkgs; [
    claude-code
    raycast
    telegram-desktop
    anki
    zotero
    orbstack
  ];
}
