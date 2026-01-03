# VPS-specific configuration (Hetzner ARM)
{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common.nix
  ];

  # Bootloader - GRUB for VPS compatibility
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda"; # Adjust based on Hetzner disk

  networking.hostName = "nixos-vps";

  # Tailscale for secure access
  services.tailscale.enable = true;

  # Hardened SSH
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
      KbdInteractiveAuthentication = false;
    };
  };

  # Add your SSH public key here
  users.users.morpheus.openssh.authorizedKeys.keys = [
    # "ssh-ed25519 AAAA... your-key-here"
  ];

  # Fail2ban for additional security
  services.fail2ban = {
    enable = true;
    maxretry = 5;
  };

  # Enable firewall on VPS
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 ];
    # Tailscale manages its own firewall rules
    trustedInterfaces = [ "tailscale0" ];
  };
}
