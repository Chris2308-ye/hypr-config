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



hl.window_rule({
    name    = "games-performance-and-clarity",
    match   = {
        -- Matches native games or titles running through Wine/Proton/XWayland
        class = "^(steam_app_.*|wine|doto|csgo|hl2_linux|Minecraft.*|lutris|osu!)$"
    },

    -- Strip out background blur entirely for maximum focus and frame stability
    no_blur = true,

    -- Force the active game window to be completely 100% solid


    -- Optional performance boost: tells Hyprland not to try blending layers behind this window
    opaque = true,
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
    animation = "slide top"
})
-- If you are using the Lua configuration format:
hl.window_rule({
    name = "game-tearing",
    match = { class = "." }, -- matches any game window
    immediate = true,
})
