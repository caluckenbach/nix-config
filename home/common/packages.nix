{ pkgs, ... }: {
  home.packages = with pkgs; [
    stow
    ripgrep
    eza
    fd
    gh
    htop
    yazi
    lazygit
    bun
    uv
    rustup
    bacon
    gcc
    fastfetch

    # LSP and formatters
    nil
    nixfmt-rfc-style
    lua-language-server
    stylua
    ruff
    ty
  ];
}
