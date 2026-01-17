{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    aerospace
    brave
    claude-code
    telegram-desktop
    anki
    zotero
    orbstack
    pinentry_mac
  ];
}
