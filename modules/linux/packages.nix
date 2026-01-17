{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    ghostty
    amp-cli
    claude-code
  ];
}
