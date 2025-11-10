local wezterm = require 'wezterm'

local config = wezterm.config_builder()
config.automatically_reload_config = true
config.front_end = "WebGpu"


config.initial_cols = 151
config.initial_rows = 45


config.font = wezterm.font("Hack Nerd Font Mono")
config.font_size = 14
config.use_ime = false

config.window_background_opacity = 0.85
config.macos_window_background_blur = 20

config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.colors = {
  tab_bar = {
    background = "none",
    inactive_tab_edge = "none",
  },
}
config.show_new_tab_button_in_tab_bar = false
-- config.show_close_tab_button_in_tabs = false

config.send_composed_key_when_right_alt_is_pressed = false
config.send_composed_key_when_left_alt_is_pressed = false
config.disable_default_key_bindings = true
config.keys = require("keybinds").keys
config.key_tables = require("keybinds").key_tables


config.color_scheme = 'Aardvark Blue'
config.window_background_image = os.getenv("HOME") .. "/wallpaper/9d2klx.png"
return config
