#!/usr/bin/env bash
set -e

GAME_DIR="/home/juan/.steam/debian-installation/steamapps/common/AoE2DE"
SENSEIDE="/home/juan/bin/senseide-aoe2"
DXVK_CONF="${GAME_DIR}/dxvk.conf"

echo "🚀 Aplicando ajustes Ultra-Performance (PERFIL GANADOR 1000+)..."

# 1. ZRAM + swappiness
swapoff -a || true
modprobe -r zram || true
modprobe zram num_devices=1 || true
ZDEV=$(zramctl --find --size 4G --algorithm zstd)
mkswap "$ZDEV" >/dev/null
swapon "$ZDEV" -p 100
sysctl -w vm.swappiness=100 >/dev/null

# 2. DXVK: mantener el perfil mínimo y probado
cat > "$DXVK_CONF" <<'EOF'
dxvk.numCompilerThreads = 2
d3d11.dcSingleThreaded = True
d3d11.samplerAnisotropy = 0
EOF

# 3. Purga visual del escritorio
sudo -u juan "$SENSEIDE" disable-all-effects
sudo -u juan "$SENSEIDE" skip-intro on

echo ""
echo "✅ SISTEMA PREPARADO (PERFIL 1434x758 @ 40%)"
echo "1. Resolución en Steam: 1434x758"
echo "2. Render Scale DENTRO DEL JUEGO: 40% (OBLIGATORIO)"
echo "3. Interfaz de Steam (Overlay): DESACTIVADA"
