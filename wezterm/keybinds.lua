local wezterm = require 'wezterm'
local act = wezterm.action

return {
  keys = {
    { key = '¥', mods = 'NONE', action = act.SendString("\\" ) },

    -- ==== タブ・ウィンドウ ====
    { key = 't', mods = 'CMD', action = act.SpawnTab 'CurrentPaneDomain' },
    { key = 'w', mods = 'CMD', action = act.CloseCurrentTab{ confirm = false } },
    { key = 'q', mods = 'CMD', action = act.QuitApplication },
    { key = "n", mods = "CMD", action = act.SpawnCommandInNewWindow({ cwd = wezterm.home_dir }) },
    -- ==== タブ移動 ====
    { key = 'Tab', mods = 'CTRL', action = act.ActivateTabRelative(1) },
    { key = 'Tab', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(-1) },

    -- ==== フルスクリーン ====
    { key = 'Enter', mods = 'ALT', action = act.ToggleFullScreen },

    -- ==== コピー・ペースト ====
    { key = 'c', mods = 'CMD', action = act.CopyTo 'Clipboard' },
    { key = 'v', mods = 'CMD', action = act.PasteFrom 'Clipboard' },

  },
}
