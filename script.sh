#!/bin/bash

CHROME_DIR="$HOME/Library/Application Support/Google/Chrome"
USER_HOME="$HOME"

# Initial free space
INITIAL_FREE_GB=$(df -H / | awk 'NR==2 {print $4}' | sed 's/G//')

echo "======================================"
echo "Initial: ${INITIAL_FREE_GB} GB free space"
echo "======================================"

echo ""
echo "======================================"
echo "Starting system cleanup..."
echo "======================================"

echo "[1/6] Cleaning Time Machine local snapshots (purgeable space)..."
SNAPSHOTS=$(tmutil listlocalsnapshots / 2>/dev/null | grep "com.apple" | awk -F'.' '{print $NF}')
if [ -n "$SNAPSHOTS" ]; then
    echo "$SNAPSHOTS" | while read -r snapshot; do
        tmutil deletelocalsnapshots "$snapshot" 2>/dev/null
    done
    echo "Deleted $(echo "$SNAPSHOTS" | wc -l | tr -d ' ') snapshot(s)"
fi

rm -rf ~/Library/Caches/com.apple.bird 2>/dev/null
rm -rf /private/var/vm/sleepimage 2>/dev/null
rm -rf ~/Downloads/.DS_Store 2>/dev/null

periodic daily weekly monthly 2>/dev/null

echo "[2/6] Cleaning Chrome cache and databases..."
rm -rf "$CHROME_DIR/OptGuideOnDeviceModel"

for i in {1..13}; do
    if [ $i -eq 1 ]; then
        rm -rf "$CHROME_DIR/Default/Service Worker/CacheStorage"
    fi
    rm -rf "$CHROME_DIR/Profile $i/Service Worker/CacheStorage"
done

rm -rf "$CHROME_DIR/Default/IndexedDB"
for i in {1..13}; do
    rm -rf "$CHROME_DIR/Profile $i/IndexedDB"
done

# System logs (requires root)
echo "[3/6] Cleaning system logs..."
rm -rf /Library/Logs/* 2>/dev/null
rm -rf /private/var/db/diagnostics 2>/dev/null
rm -rf /private/var/folders/* 2>/dev/null
rm -rf /private/var/log/* 2>/dev/null

# User caches
echo "[4/6] Cleaning user caches..."
rm -rf ~/Library/Caches/* 2>/dev/null
rm -rf ~/Library/Caches/com.apple.dt.XCode 2>/dev/null
rm -rf ~/Library/Caches/Homebrew/downloads 2>/dev/null
rm -rf ~/Library/Logs/* 2>/dev/null

# QuickLook cache
qlmanage -r cache 2>/dev/null

# Xcode files
echo "[5/6] Cleaning developer tools (Xcode, VS Code, npm...)"
rm -rf ~/Library/Developer/Xcode/Archives
rm -rf ~/Library/Developer/Xcode/DerivedData
rm -rf ~/Library/Developer/Xcode/iOS\ DeviceSupport

# VS Code Cache
rm -rf "$USER_HOME/Library/Application Support/Code/Cache" 2>/dev/null
rm -rf "$USER_HOME/Library/Application Support/Code/CachedData" 2>/dev/null

# NPM & Yarn Cache
rm -rf "$USER_HOME/.npm/*" 2>/dev/null
rm -rf "$USER_HOME/Library/Caches/Yarn" 2>/dev/null

# Application caches and other files
echo "[6/6] Cleaning application caches and other files..."
rm -rf /Library/LaunchDaemons/com.microsoft.office.licensingV2.helper.plist 2>/dev/null
rm -rf /opt/homebrew/Caskroom/microsoft 2>/dev/null
rm -rf "$USER_HOME/Library/Application Support/SoundCloud/Cache" 2>/dev/null
rm -rf "$USER_HOME/Library/Application Support/discord/Cache" 2>/dev/null
rm -rf "$USER_HOME/Library/pnpm" 2>/dev/null
rm -rf "$USER_HOME/Library/Metadata/CoreSpotlight" 2>/dev/null

# Spotify
rm -rf "$USER_HOME/Library/Application Support/Spotify/PersistentCache" 2>/dev/null
rm -rf "$USER_HOME/Library/Caches/com.spotify.client" 2>/dev/null

# Slack
rm -rf "$USER_HOME/Library/Application Support/Slack/Service Worker/CacheStorage" 2>/dev/null
rm -rf "$USER_HOME/Library/Application Support/Slack/Cache" 2>/dev/null
rm -rf "$USER_HOME/Library/Caches/com.tinyspeck.slackmacgap" 2>/dev/null

# Trash
rm -rf ~/.Trash/* 2>/dev/null

echo "======================================"
echo "Cleanup completed!"
echo "======================================"

# Final free space
FINAL_FREE_GB=$(df -H / | awk 'NR==2 {print $4}' | sed 's/G//')

# Freed space calculation
FREED_GB=$(echo "scale=2; $FINAL_FREE_GB - $INITIAL_FREE_GB" | bc)

echo ""
echo "Final: ${FINAL_FREE_GB} GB free space"
echo "✅ Freed space: ${FREED_GB} GB"