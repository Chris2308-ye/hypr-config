-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch menulike this:
--
hl.on("hyprland.start", function()
    --   hl.exec_cmd(terminal)
    --   hl.exec_cmd("nm-applet")
    hl.exec_cmd("waypaper --restore")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("swaync")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("waybar")
    hl.exec_cmd("swayosd-server")
    hl.exec_cmd("steam -silent")
    hl.exec_cmd("killall hypridle; hypridle")
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    hl.exec_cmd("fcitx5")
    hl.exec_cmd("/usr/lib/xdg-desktop-portal-hyprland")
    hl.exec_cmd("/usr/lib/xdg-desktop-portal")
    -- hl.exec_cmd("/home/chris/.config/hypr/scripts/auto-monitor.sh")
end)
