--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name           = "suppress-maximize-events",
    match          = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name     = "fix-xwayland-drags",
    match    = {
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

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})
hl.window_rule({
    name  = "swappy-float",
    match = { class = "swappy" },
    float = true,
})
hl.window_rule({
    name   = "waypaper-float",
    match  = { class = "waypaper" },
    float  = true,
    center = true,
})





hl.layer_rule({
    name = "rofi-popup",
    match = { namespace = "rofi" },
    animation = "slide bottom",
    dim_around = true
})
hl.layer_rule({
    name = "notification-animations",
    match = { namespace = "swaync-control-center" },
    animation = "slide bottom"
})
-- If you are using the Lua configuration format:
hl.window_rule({
    name = "game-tearing",
    match = { class = "." }, -- matches any game window
    immediate = true,
})

-- Keeps games 100% solid, even if they lose focus or run in the background
hl.window_rule({
    name    = "games-performance-and-clarity",
    match   = {
        -- Matches native games or titles running through Wine/Proton/XWayland
        class = "^(steam_app_.*|wine|doto|csgo|hl2_linux|Minecraft.*|lutris|osu!|Mesen|blender|vesktop|[Bb]rave.*)$"
    },

    -- Strip out background blur entirely for maximum focus and frame stability
    no_blur = true,
    opaque  = true,

    -- First 1.0 forces active opacity, second 1.0 forces inactive override
    opacity = "1.0 override 1.0 override",
})

-- Prevent Steam client windows from going transparent
hl.window_rule({
    name    = "steam-opacity-fix",
    match   = { class = "^(steam)$" },

    opaque  = true,
    opacity = "1.0 override 1.0 override",
})

-- Prevent Zen Browser from going transparent
hl.window_rule({
    name    = "zen-browser-opacity-fix",
    match   = { class = "^(zen-alpha|zen)$" },

    opaque  = true,
    opacity = "1.0 override 1.0 override",
})
