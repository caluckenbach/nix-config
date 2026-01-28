{
  programs.zsh.enable = true;

  # Prevent "Last login" message
  environment.etc."zshrc".text = ''
    # Prevent "Last login" message
  '';

  # Increase file descriptor limit for Nix operations
  system.activationScripts.set-ulimit.text = ''
    launchctl limit maxfiles 65536 200000
  '';
}
