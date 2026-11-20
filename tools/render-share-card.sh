#!/usr/bin/env bash
# Renders the link-preview image and app icons with headless Chrome (macOS).
# Run from the repo root: tools/render-share-card.sh
set -euo pipefail

CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

shot() { # url width height out.png
  "$CHROME" --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=1 \
    --virtual-time-budget=5000 --window-size="$2,$3" --screenshot="$4" "$1" >/dev/null 2>&1
}

# 1200x630 share card -> JPEG
shot "file://$ROOT/tools/share-card.html" 1200 630 "$TMP/card.png"
sips -s format jpeg -s formatOptions 85 "$TMP/card.png" --out "$ROOT/images/share-card.jpg" >/dev/null

# Icons from favicon.svg on a cream background (iOS ignores transparency)
cat > "$TMP/icon.html" <<HTML
<!doctype html><style>html,body{margin:0;background:#f6f1e7}
img{display:block;width:100vw;height:100vh}</style><img src="file://$ROOT/favicon.svg">
HTML
shot "file://$TMP/icon.html" 512 512 "$TMP/icon.png"
sips -z 180 180 "$TMP/icon.png" --out "$ROOT/apple-touch-icon.png" >/dev/null
sips -z 32 32 "$TMP/icon.png" --out "$ROOT/favicon-32.png" >/dev/null

echo "Wrote images/share-card.jpg, apple-touch-icon.png, favicon-32.png"
