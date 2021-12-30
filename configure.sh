#!/bin/sh
# XRay new configuration
cat <<-EOF > /etc/xray/config.json
$CONFIG_JSON
EOF
# Run XRay
/usr/bin/xray/xray -config=/etc/xray/config.json
