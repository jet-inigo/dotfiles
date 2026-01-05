-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font_size = 14
config.font = wezterm.font 'SpaceMonoNerdFont'
config.color_scheme = 'Neon (terminal.sexy)'

-- Spawn a fish shell
config.default_prog = { '/usr/bin/fish' }

-- Emulate old tmux setup
config.disable_default_key_bindings = true
config.leader = { key = 's', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
    -- font resizing
    {
        mods   = "CTRL",
        key    = "-",
        action = act.IncreaseFontSize,
    },
    {
        mods   = "CTRL",
        key    = "=",
        action = act.DecreaseFontSize,
    },
    -- splitting
    {
        mods   = "LEADER",
        key    = "u",
        action = act.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        mods   = "LEADER",
        key    = "i",
        action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    -- switching
    {
        mods   = "LEADER",
        key    = "h",
        action = act.ActivatePaneDirection "Left",
    },
    {
        mods   = "LEADER",
        key    = "j",
        action = act.ActivatePaneDirection "Down",
    },
    {
        mods   = "LEADER",
        key    = "k",
        action = act.ActivatePaneDirection "Up",
    },
    {
        mods   = "LEADER",
        key    = "l",
        action = act.ActivatePaneDirection "Right",
    },
    -- zooming
    {
        mods   = "LEADER",
        key    = "z",
        action = act.TogglePaneZoomState,
    },
    -- tabs
    {
        mods   = "LEADER",
        key    = "t",
        action = act.SpawnTab "CurrentPaneDomain",
    },
    {
        mods   = "LEADER",
        key    = "w",
        action = act.CloseCurrentTab { confirm = true },
    },
    {
        mods   = "LEADER",
        key    = "Tab",
        action = act.ActivateLastTab,
    },
    -- tab activation hotkeys for tabs 1-9 added later
    {
        mods   = "LEADER",
        key    = "0",
        action = act.ActivateTab(-1),
    },
    -- copy/paste
    {
        mods   = "CTRL|SHIFT",
        key    = "c",
        action = act.Multiple {
            act.CopyTo "Clipboard",
            act.ClearSelection,
        }
    },
    {
        mods   = "CTRL|SHIFT",
        key    = "v",
        action = act.PasteFrom "Clipboard",
    },
    -- copy mode
    {
        mods   = "LEADER",
        key    = "v",
        action = act.ActivateCopyMode,
    },
    -- show workspaces
    {
        mods   = "LEADER",
        key    = "s",
        action = act.ShowLauncherArgs {
            flags = 'WORKSPACES',
        },
    },
}
for i = 1, 9 do
    local tab_activation_hotkey = {
        mods   = "LEADER",
        key    = tostring(i),
        action = act.ActivateTab(i - 1),
    }
    table.insert(config.keys, tab_activation_hotkey)
end

-- Finally, return the configuration to wezterm:
return config
