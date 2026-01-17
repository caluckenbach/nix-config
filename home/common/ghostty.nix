{ config, ... }: let
  inherit (config) theme;
in {
  xdg.configFile."ghostty/config".text = ''
    font-family = ${theme.font.mono}
    font-size = ${toString theme.font.size}
    theme = Gruvbox Dark

    # Hide window decorations and tab bar
    window-decoration = none
    gtk-titlebar = false

    # Visual polish
    window-padding-x = 8
    window-padding-y = 6
    cursor-style = bar
    cursor-style-blink = false

    background-opacity = 0.95
    background-blur-radius = 20
    macos-non-native-fullscreen = visible-menu
    macos-option-as-alt = left

    mouse-hide-while-typing = true
    mouse-scroll-multiplier = 2

    # Prevent app from quitting when last window closes (like macOS)
    quit-after-last-window-closed = false

    # Keybinds to match macOS since this is a VM
    keybind = super+c=copy_to_clipboard
    keybind = super+v=paste_from_clipboard
    keybind = super+shift+c=copy_to_clipboard
    keybind = super+shift+v=paste_from_clipboard
    keybind = super+equal=increase_font_size:1
    keybind = super+minus=decrease_font_size:1
    keybind = super+zero=reset_font_size
    keybind = super+q=unbind
    keybind = super+shift+comma=reload_config
    keybind = super+k=clear_screen
    keybind = super+n=new_window
    keybind = super+w=close_surface
    keybind = super+shift+w=unbind
    keybind = super+alt+w=close_tab:this
    keybind = super+alt+shift+w=unbind
    confirm-close-surface = true
    keybind = super+t=new_tab
    keybind = super+shift+left_bracket=previous_tab
    keybind = super+shift+right_bracket=next_tab
    keybind = super+d=new_split:right
    keybind = super+shift+d=new_split:down
    keybind = super+right_bracket=goto_split:next
    keybind = super+left_bracket=goto_split:previous
    keybind = shift+enter=text:\n
  '';
}
