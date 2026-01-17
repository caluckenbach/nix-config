# NixOS & nix-darwin Configuration

Multi-platform Nix configuration for NixOS (Linux) and nix-darwin (macOS) using flakes.

## Structure

```
.
├── flake.nix              # Flake with dynamic host discovery
├── lib/                   # Custom library functions
│   ├── default.nix        # Library aggregator
│   ├── filesystem.nix     # collectNix utility
│   ├── option.nix         # mkConst, mkValue helpers
│   ├── system.nix         # nixosSystem', darwinSystem' wrappers
│   └── values.nix         # enabled, disabled helpers
├── modules/
│   ├── common/            # Cross-platform system modules
│   ├── linux/             # NixOS-specific modules
│   └── darwin/            # nix-darwin-specific modules
├── home/
│   ├── common/            # Cross-platform home-manager modules
│   ├── linux/             # Linux-specific home modules
│   └── darwin/            # macOS-specific home modules
└── hosts/
    ├── vm/                # NixOS VM configuration
    ├── vps/               # NixOS VPS configuration
    └── mbp/               # macOS MacBook Pro configuration
```

## Usage

### macOS (nix-darwin)

**First time setup:**
```sh
# Install nix (if not already installed)
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# Clone and apply
git clone https://github.com/caluckenbach/nixos-config.git
cd nixos-config
nix run nix-darwin -- switch --flake .#mbp
```

**Rebuild after changes:**
```sh
darwin-rebuild switch --flake .#mbp
```

**With pretty output (nom):**
```sh
darwin-rebuild switch --flake .#mbp |& nom
```

### NixOS (Linux)

**Rebuild system:**
```sh
sudo nixos-rebuild switch --flake .#vm
# or
sudo nixos-rebuild switch --flake .#vps
```

**With pretty output:**
```sh
sudo nixos-rebuild switch --flake .#vm |& nom
```

## Hosts

| Host | Platform | Type | User |
|------|----------|------|------|
| `mbp` | macOS (aarch64-darwin) | Desktop | cal |
| `vm` | NixOS (aarch64-linux) | Desktop | morpheus |
| `vps` | NixOS (x86_64-linux) | Server | morpheus |

## What's Included

### System
- Nix flakes with automatic host discovery
- Home Manager integration
- Platform-specific defaults (macOS: Dock, Finder, keyboard settings)
- Homebrew integration for macOS casks not in nixpkgs

### Shell & Terminal
- Zsh with autosuggestions, syntax highlighting
- Starship prompt
- Ghostty terminal
- Zellij multiplexer with zjstatus

### Development
- **Editors:** Neovim, Helix, Zed (macOS)
- **VCS:** Git, Jujutsu, lazygit, gitui
- **Languages:** Rust (rustup, bacon), Python (uv, ruff), Bun, Lua
- **LSP:** nil, lua-language-server, ruff
- **Formatters:** nixfmt-rfc-style, stylua, ty

### Tools
- eza, bat, ripgrep, fd, fzf, zoxide
- yazi, glow, jless, jnv
- ffmpeg, yt-dlp, xh, tokei
- nix-output-monitor (nom)

### AI/LLM
- claude-code
- opencode
- llm

### macOS Apps (via nix)
- Raycast, Anki, Telegram, Zotero, OrbStack

### macOS Apps (via Homebrew)
- Figma, ProtonVPN, Sublime Text
