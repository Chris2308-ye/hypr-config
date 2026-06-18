#!/bin/bash
set -e

LAPTOP="eDP-1"
CONFIG="$HOME/.config/hypr/configs/monitors.lua"

EXTERNAL=$(hyprctl monitors -j 2>/dev/null | python3 -c "
import json, sys
data = json.load(sys.stdin)
for m in data:
    if m['name'] != '$LAPTOP' and not m['disabled']:
        print(m['name'])
        break
")

mkdir -p "$(dirname "$CONFIG")"

if [ -n "$EXTERNAL" ]; then
    cat > "$CONFIG" << EOF
hl.monitor({
    output   = "$EXTERNAL",
    mode     = "1920x1080@120",
    position = "0x0",
    scale    = "1",
})

hl.monitor({
    output   = "$LAPTOP",
    mode     = "preferred",
    position = "1920x0",
    scale    = "1",
})

hl.workspace_rule({ workspace = "1", monitor = "$EXTERNAL", default = true })
hl.workspace_rule({ workspace = "2", monitor = "$EXTERNAL" })
hl.workspace_rule({ workspace = "3", monitor = "$EXTERNAL" })
hl.workspace_rule({ workspace = "4", monitor = "$EXTERNAL" })
hl.workspace_rule({ workspace = "5", monitor = "$EXTERNAL" })

hl.workspace_rule({ workspace = "6", monitor = "$LAPTOP", default = true })
hl.workspace_rule({ workspace = "7", monitor = "$LAPTOP" })
hl.workspace_rule({ workspace = "8", monitor = "$LAPTOP" })
hl.workspace_rule({ workspace = "9", monitor = "$LAPTOP" })
hl.workspace_rule({ workspace = "10", monitor = "$LAPTOP" })
EOF
else
    cat > "$CONFIG" << EOF
hl.monitor({
    output   = "$LAPTOP",
    mode     = "preferred",
    position = "0x0",
    scale    = "1",
})


EOF
fi

hyprctl reload
