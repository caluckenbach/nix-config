{ pkgs, ... }: {
  home.packages = with pkgs; [
    ghostty
    amp-cli
    claude-code
  ];
}
