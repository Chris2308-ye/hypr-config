---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout    = "us",
        kb_variant   = "",
        kb_model     = "",
        kb_options   = "",
        kb_rules     = "",

        follow_mouse = 1,

        sensitivity  = 0, -- -1.0 - 1.0, 0 means no modification.


        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name          = "logitech-g305-1",
    sensitivity   = -0.7,
    accel_profile = flat
})
hl.device({
    name                 = "synaptics-tm3336-004",
    sensitivity          = 0,
    disable_while_typing = false,
    scroll_factor        = 0.3
})

hl.device({
    name = "at-translated-set-2-keyboard",
    kb_options = "caps:swapescape"

})
