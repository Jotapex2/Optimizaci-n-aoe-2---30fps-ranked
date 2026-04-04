#!/usr/bin/env bash
set -e

STEAM_LAUNCH='WINE_FULLSCREEN_FSR=1 WINE_FULLSCREEN_FSR_CUSTOM_MODE=1434x758 WINE_FULLSCREEN_FSR_STRENGTH=5 gamemoderun mesa_glthread=true WINEFSYNC=1 vblank_mode=0 %command% -novid -nojoy'

if [[ "${1:-}" == "print" ]]; then
  echo "$STEAM_LAUNCH"
fi
