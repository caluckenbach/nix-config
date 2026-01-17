{ config, lib, pkgs, ... }: let
  inherit (lib) enabled;
in {
  xsession = enabled {
    windowManager.i3 = enabled {
      package = pkgs.i3;
      config = {
        bars = [
          {
            position      = "bottom";
            statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ${config.xdg.configHome}/i3status-rust/config-bottom.toml";
            colors = {
              background = "#282828";
              statusline = "#ebdbb2";
              focusedWorkspace = {
                border     = "#458588";
                background = "#458588";
                text       = "#ebdbb2";
              };
              inactiveWorkspace = {
                border     = "#282828";
                background = "#282828";
                text       = "#928374";
              };
            };
            fonts = {
              names = [ "TX-02" ];
              size  = 12.0;
            };
          }
        ];
        window.border    = 0;
        defaultWorkspace = "1";

        startup = [
          {
            command      = "vmware-user-suid-wrapper";
            notification = false;
          }
          {
            command      = "ghostty";
            notification = false;
          }
        ];

        keybindings = lib.mkOptionDefault {
          "Mod1+Shift+e" = "exec i3-msg exit";
        };
      };
    };
  };

  programs.i3status-rust = enabled {
    bars.bottom = {
      theme = "gruvbox-dark";
      icons = "awesome6";
      blocks = [
        {
          block  = "memory";
          format = " $mem_used/$mem_total ";
        }
        {
          block  = "cpu";
          format = " $utilization ";
        }
        {
          block  = "disk_space";
          path   = "/";
          format = " $available ";
        }
      ];
    };
  };
}
