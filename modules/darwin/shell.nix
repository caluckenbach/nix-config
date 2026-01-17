{
  programs.zsh.enable = true;

  # Prevent "Last login" message
  environment.etc."zshrc".text = ''
    # Prevent "Last login" message
  '';
}
