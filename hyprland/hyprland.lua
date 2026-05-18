
hl.bind("ALT + TAB", hl.dsp.window.cycle_next())






-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")

 
------------------
---- MONITORS ----
------------------
-- [DP-2 / Dell P2719H] [HDMI-A-1 / Dell P2414H]
--                       [DP-3 / BenQ BL2480, alla]

hl.monitor({
    output   = "DP-2",
    mode     = "1920x1080@60",
    position = "0x0",
    scale    = 1,
})

hl.monitor({
    output   = "DP-3",
    mode     = "1920x1080@60",
    position = "1920x0",
    scale    = 1,
})

hl.monitor({
    output   = "HDMI-A-1",
    mode     = "1920x1080@60",
    position = "1920x1080",
    scale    = 1,
})

-- fake monitor
hl.monitor({
    output   = "DP-1",
    mode     = "1920x1080@60",
    position = "0x1080",
    scale    = 1,
})


---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "hyprlauncher"


-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

 hl.on("hyprland.start", function () 
   hl.exec_cmd(terminal)
   hl.exec_cmd("flatpak run com.discordapp.Discord")
   hl.exec_cmd("nm-applet")
   hl.exec_cmd("waybar")
   hl.exec_cmd("hyprpaper")
--   hl.exec_cmd("hyprexpose")

 end)


hl.bind("SUPER + g", function()
    hl.plugin.hyprexpo.expo("toggle")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")


-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 2,
        gaps_out = 3,

        border_size = 1,

        col = {
            active_border   = { colors = {"rgba(D426EDFF)", "rgba(D426EDDD)"}, angle = 75 },
            inactive_border = "rgba(D426ED65)",
        },

        layout = "dwindle",
    },

    decoration = {
        rounding       = 5,
        rounding_power = 3,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 0.75,

        shadow = {
            enabled      = false,
            range        = 5,
            render_power = 10,
            color        = 0xff8e1d9e,
        },

        blur = {
            enabled   = true,
            size      = 15,
            passes    = 2,
            vibrancy  = 1,
            new_optimizations = true,
            xray = false,
            ignore_opacity = true
        },
    },

    animations = {
        enabled = true,
    },
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "fi",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",
        follow_mouse = 1,
    },
})

--[[
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})
--]]
-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more

hl.device({
    name = "razer-razer-deathadder-elite",
    natural_scroll = false,
    force_no_accel,
    sensitivity = -0.5
})

hl.device({
    name = "logitech-optical-usb-mouse",
    natural_scroll = false,
    force_no_accel,
    accel_profile = "flat",
    sensitivity = 0.5
})

-- uusin sinowealth-model-o-eternal

hl.device({
    name = "sinowealth-model-o-eternal",
    natural_scroll = false,
    force_no_accel,
    accel_profile = "flat",
    sensitivity = 1
})



---------------------
---- KEYBINDINGS ----
---------------------
local mainMod = "SUPER"
---- ----------- ----

-- Move window to workspace without focusing
for i = 1, 9 do
    hl.bind("SUPER + " .. i, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Switch to workspace
for i = 1, 9 do
    hl.bind("CTRL + SUPER + " .. i, hl.dsp.focus({ workspace = i }))
end

--[[
hl.config({
    plugin = {
        hyprexpo = {
            columns = 3,
            gap_size = 0,
            bg_col = "rgba(1, 1, 1, 0)",
            workspace_method = "center current",
            skip_empty = true,
        },
    },
})
--]]	

--[[
hl.bind("SUPER + tab", function()
    hl.plugin.hyprexpo.expo("toggle")
end)
--]]


-- !WORKSPACE to specific monitor
hl.workspace_rule({ workspace = "1", monitor = "DP-2", default = true })
hl.workspace_rule({ workspace = "2", monitor = "DP-3", default = true })
hl.workspace_rule({ workspace = "3", monitor = "HDMI-A-1", default = true })

--[[
-- hyprexpo WORKSPACE OVERVIEW
hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd("pkill -SIGUSR1 hyprexpose || hyprexpose &"))
--]]

-- terminal open
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(terminal))

--[[
-- close window OG version (not entirely)
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
--]]

-- cmd kill active window
local kill_cmd = "kill $(hyprctl activewindow -j | lua -e \"print(io.read('*a'):match('\\\"pid\\\":%s*(%d+)'))\")"
-- bind to kill active window
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(kill_cmd))



-- Screenshot to CLIPBOARD
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
-- Screenshot to DISC + CLIPBOARD
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("hyprshot -m region"))


-- Shutdown Menu
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command wlogout"))

-- File Manager
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))

-- Toggle Float
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))

-- App finder
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))

-- Switch tiling horinzonal / vertical
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only

-- Fullscreen
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ action = "toggle" }))

-- Windowed Fullscreen
hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle", mode = 1 })) 


-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })


-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------




-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
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

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

------------------
-- Window rules --
------------------

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

-- kitty
hl.window_rule({
    name = "kitty_conf",
    match = {
        class = "^kitty$",
    },
    float = true,
    size = "670 460",
    center = true,
    no_blur = true
})



-- yad / music player
hl.window_rule({
    name = "yad-floating",

    match = {
        class = "yad",
    },

    float = true,
    move = "1350 45"
})



-- imv / view pics
hl.window_rule({
    name = "imv-float",
    match = {
        class = "^imv$",
    },
    float = true,
    size = "900 600",
    center = true,
})



-- some nvidia shit
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")
hl.env("GBM_BACKEND", "nvidia-drm")
