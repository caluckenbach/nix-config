{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Core utilities
    stow
    ripgrep
    eza
    fd
    gh
    htop
    tree
    jq

    # File viewers
    yazi
    glow
    bat
    jless

    # Dev tools
    tokei
    nix-output-monitor

    # Media
    ffmpeg
    yt-dlp

    # HTTP & JSON
    xh
    jnv

    # AI/LLM
    llm
    opencode

    # Documentation
    tealdeer

    # Security
    gnupg

    # Languages & runtimes
    bun
    uv
    rustup
    bacon
    gcc

    # LSP and formatters
    nil
    nixfmt-rfc-style
    lua-language-server
    stylua
    ruff
    ty

    # System info
    fastfetch
  ];
}
