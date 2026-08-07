hl.bind("SUPER + return", hl.dsp.exec_cmd("kitty"), { submap_universal = true, description = "open a terminal" })
hl.bind("SUPER + SHIFT + Q", hl.dsp.window.close(), { description = "close the current window" })
hl.bind(
    "SUPER + M",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"),
    { description = "quit hyprland" }
)
hl.bind("SUPER + V", hl.dsp.window.float({action = "toggle"}), { description = "toggle window floating state"})
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("hyprlauncher"), { description = "start hyprlauncher" })
hl.bind("SUPER + F", hl.dsp.exec_cmd("zen"), { description = "start zen browser" })
hl.bind("SUPER + TAB", hl.dsp.focus({ last = true }), { description = "switch to the last active window"})

local directions = {
    left = "H",
    right = "L",
    up = "K",
    down = "J",
}
for dir,key in pairs(directions) do
    hl.bind("SUPER + " .. key, hl.dsp.focus({direction = dir}), { description = "move focus " .. dir })
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({direction = dir}), { description = "move window " .. dir })
end

hl.bind("SUPER + R", hl.dsp.submap("resize"), { description = "enter resize mode" })
hl.define_submap("resize", function()
    hl.bind("right", hl.dsp.window.resize({ x = 10, y = 0, relative = true}), { repeating = true })
    hl.bind("left", hl.dsp.window.resize({ x = -10, y = 0, relative = true}), { repeating = true })
    hl.bind("up", hl.dsp.window.resize({ x = 0, y = 10, relative = true}), { repeating = true })
    hl.bind("down", hl.dsp.window.resize({ x = 0, y = -10, relative = true}), { repeating = true })

    hl.bind("escape", hl.dsp.submap("reset"))
end)

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind("SUPER + " .. key,             hl.dsp.focus({ workspace = i}), {description = "go to workspace " .. i})
    hl.bind("SUPER + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }), {description = "move window to workspace " .. i})
end

local appWorkspaces = {
    discord = "D",
    steam = "T",
    spotify = "P",
}
for app,key in pairs(appWorkspaces) do
    hl.bind("SUPER + " .. key,             hl.dsp.focus({ workspace = "name:"..app }), {description = "go to " .. app .. "'s workspace"})
    hl.bind("SUPER + SHIFT + " .. key,     hl.dsp.window.move({ workspace = "name:"..app  }), {description = "move window to " .. app .. "'s workspace"})
end

hl.bind("SUPER + S", hl.dsp.exec_cmd("grimblast copy area"))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("grimblast copy output"))
hl.bind("SUPER + ALT + S", hl.dsp.exec_cmd("grimblast save area"))
hl.bind("SUPER + ALT + SHIFT + S", hl.dsp.exec_cmd("grimblast save output"))

hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { repeating = true })
hl.bind("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e-1" }), { repeating = true })

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })    -- ALT + LMB: Move a window
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })  -- ALT + RMB: Resize a window

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true, description = "increase volume" })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true, description = "decrease volume" })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true, description = "mute audio" })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true, description = "mute microphone" })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true, description = "increase monitor brightness" })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true, description = "decrease monitor brightness" })

-- For keyboards w/o media keys
hl.bind("code:78", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true, description = "increase volume" })
hl.bind("code:107", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true, description = "decrease volume" })
hl.bind("code:127",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true, description = "mute audio" })
