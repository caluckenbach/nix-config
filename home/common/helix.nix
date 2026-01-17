{ lib, ... }: let
  inherit (lib) enabled;
in {
  programs.helix = enabled {
    settings = {
      theme = "gruvbox_dark_hard";

      editor = {
        line-number = "relative";
        mouse       = false;

        auto-save.focus-lost = true;

        cursor-shape = {
          insert = "bar";
          select = "underline";
        };

        file-picker.hidden = false;

        inline-diagnostics = {
          cursor-line = "warning";
          other-lines = "error";
        };

        lsp.display-inlay-hints = true;

        soft-wrap.enable = true;

        statusline = {
          left   = [ "mode" "spinner" ];
          center = [ "file-name" "file-type" ];
          right  = [ "diagnostics" "selections" "position" "file-line-ending" ];

          mode = {
            insert = "INSERT";
            normal = "NORMAL";
            select = "SELECT";
          };
        };

        indent-guides = {
          render    = true;
          character = "╎";
        };
      };

      keys.insert.j = {
        k   = "normal_mode";
        esc = [ "collapse_selection" "normal_mode" ];
      };
    };
  };
}
