{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    aerospace
    brave
    claude-code
    anki
    zotero
    orbstack
    pinentry_mac
  ];
}
