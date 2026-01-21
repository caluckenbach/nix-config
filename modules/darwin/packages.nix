{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    aerospace
    brave
    zotero
    orbstack
    pinentry_mac
  ];
}
