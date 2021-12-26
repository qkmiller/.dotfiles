#!/bin/bash
command -v powertop >/dev/null || { echo >&2 "Powertop not found\nExiting..."; exit 1; }

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    echo "Exiting..."
    exit 1
fi
cat << EOF > /etc/systemd/system/powertop-autotune.service
# /etc/systemd/system/powertop-autotune.service
[Unit]
Description=Autotune power save settings (oneshot)

[Service]
Type=oneshot
ExecStart=/usr/bin/powertop --auto-tune
RemainAfterExit=true

[Install]
WantedBy=multi-user.target
EOF
systemctl enable --now powertop-autotune.service
