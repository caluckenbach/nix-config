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
    just
    tokei
    nix-output-monitor

    # Media
    ffmpeg
    yt-dlp

    # HTTP & JSON
    xh
    jnv

    # AI/LLM
    claude-code
    llm
    opencode

    # Documentation
    tealdeer

    # Security
    gnupg

    # Languages & runtimes
    nodejs
    bun
    uv
    rustup
    bacon
    gcc

    # LSP and formatters
    nil
    nixfmt
    lua-language-server
    stylua
    ruff
    ty
    typescript-go
    biome

    # System info
    fastfetch

    # CLIs
    azure-cli
  ];
}
