-- Hyprland config (Lua). Migrated from hyprland.conf for Hyprland 0.55+.
-- See https://wiki.hypr.land/Configuring/Start/

------------------
---- MONITORS ----
------------------

-- PC
hl.monitor({ output = "HDMI-A-1", mode = "3840x2160@60", position = "0x0",    scale = 1.6 })
hl.monitor({ output = "DP-2",     mode = "3840x2160@60", position = "2400x0", scale = 1.6 })

-- laptop default
-- hl.monitor({ output = "eDP-1", mode = "3456x2160@60", position = "0x0", scale = 2 })


---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "ghostty"
local fileManager = "yazi"
local browser     = "google-chrome-stable"
local menu        = "rofi -show drun"

local teal = "rgb(8bd5ca)"


-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd(terminal .. " & awww-daemon & sleep 1 && awww img ~/projects/wallpapers/train_rain_lights_anime.jpeg")
    hl.exec_cmd("blueman-applet & nm-applet &")
    hl.exec_cmd("clipse -listen &")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")


-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 10,

        border_size = 2,

        col = {
            active_border   = teal,
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = false,

        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding = 10,

        active_opacity     = 0.95,
        inactive_opacity   = 0.90,
        fullscreen_opacity = 0.90,

        blur = {
            size   = 8,
            passes = 2,
        },

        shadow = {
            enabled        = true,
            range          = 15,
            render_power   = 3,
            offset         = { 0, 0 },
            color          = teal,
            color_inactive = "rgba(595959aa)",
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
        smart_split    = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper   = -1,
        disable_hyprland_logo     = true,
        disable_splash_rendering  = true,
        background_color          = 0x24373a,
    },
})

-- Animations: curves and per-leaf settings
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows",    enabled = true, speed = 2, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border",     enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "fade",       enabled = true, speed = 2, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1, bezier = "default" })


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0,

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

hl.device({ name = "epic-mouse-v1", sensitivity = -0.5 })


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

hl.bind(mainMod .. " + T",     hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q",     hl.dsp.window.close())
hl.bind(mainMod .. " + E",     hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V",     hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P",     hl.dsp.window.pseudo())              -- dwindle
hl.bind(mainMod .. " + X",     hl.dsp.layout("togglesplit"))        -- dwindle
hl.bind(mainMod .. " + R",         hl.dsp.exec_cmd('grim -g "$(slurp)" - | tee ~/Pictures/screenshot-$(date +%Y%m%d-%H%M%S).png | wl-copy'))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd('grim -g "$(slurp)" - | satty --filename - --output-filename ~/Pictures/annotated-$(date +%Y%m%d-%H%M%S).png'))

-- Ghostty: class must look like a reverse domain name
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd(terminal .. " --class=com.clipse -e 'clipse'"))
hl.bind("SUPER + L",       hl.dsp.exec_cmd("hyprlock"))

hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Toggle between 'cool' borders and practical
hl.bind(mainMod .. " + equal", hl.dsp.exec_cmd("~/.config/hypr/toggle-gaps.sh"))

-- Toggle opacity (for clean browser video playback etc.)
hl.bind(mainMod .. " + minus", hl.dsp.window.tag({ tag = "opaque" }))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces (mainMod + [0-9]) and move active window to one (mainMod + SHIFT + [0-9])
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Change monitor used by workspace
hl.bind(mainMod .. " + SHIFT + backslash", hl.dsp.workspace.swap_monitors({ monitor1 = 0, monitor2 = 1 }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),   { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),   { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),  { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),{ locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl s 10%+"),                        { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"),                        { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- Opaque tag: full opacity for clean video playback etc.
hl.window_rule({ match = { tag = "opaque" }, opacity = "1.0 override" })

-- Ignore maximize requests from apps.
hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" })

-- Fix some dragging issues with XWayland
hl.window_rule({
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

-- Make clipse behave nicely
hl.window_rule({
    match        = { class = "^(com.clipse)$" },
    float        = true,
    size         = { 622, 652 },
    stay_focused = true,
})
