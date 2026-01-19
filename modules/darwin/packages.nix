{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    aerospace
    brave
    anki
    zotero
    orbstack
    pinentry_mac
  ];
}
