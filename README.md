# NixOS System Configurations

![Screenshot](https://raw.githubusercontent.com/caluckenbach/nixos-config/main/.github/images/screenshot.png)

NixOS and Home Manager configuration using flakes for aarch64-linux (VMware guest).

## Structure

```
.
├── flake.nix              # Flake definition with inputs
├── configuration.nix      # System-level NixOS configuration
├── hardware-configuration.nix  # Hardware-specific settings
└── home.nix               # User environment via Home Manager
```

## Usage

**Rebuild NixOS system:**
```sh
sudo nixos-rebuild switch --flake .#nixos
```

**Apply Home Manager configuration:**
```sh
home-manager switch --flake .#morpheus
```

## What's Included

### System (configuration.nix)
- systemd-boot bootloader
- NetworkManager
- Zsh as default shell
- X11 with startx
- GPG agent with pinentry-curses
- VMware guest tools

### User Environment (home.nix)
- **Shell:** Zsh with starship prompt, autosuggestions, syntax highlighting
- **Editor:** Neovim (default)
- **Terminal:** Ghostty
- **Window Manager:** i3 with i3status-rust bar
- **Tools:** eza, bat, ripgrep, fzf, zoxide, direnv, lazygit, yazi, fastfetch
- **Dev:** rustup (for toolchain + rust-analyzer), bacon, bun, uv, gcc
- **AI:** claude-code, amp-cli
- **VCS:** Git, Jujutsu
- **LSP/Formatters:** nil, nixfmt, lua-language-server, stylua, ruff, ty
