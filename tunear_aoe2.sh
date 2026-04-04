#!/usr/bin/env bash
set -e

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ $EUID -ne 0 ]]; then
  echo "❌ Ejecutar con sudo."
  exit 1
fi

echo "🔹 Aplicando perfil ganador de AoE2:DE..."
bash "${BASE_DIR}/aoe2_ultra_benchmark.sh"

echo "============================================================"
echo "COPIA ESTO EN STEAM:"
bash "${BASE_DIR}/aoe2_optimize.sh" print
echo "============================================================"
echo "DENTRO DEL JUEGO:"
echo "1. Resolución: 1434x758"
echo "2. Render Scale: 40%"
echo "3. V-Sync: OFF"
echo "4. Gráficos: todo en OFF/BAJO"
echo "============================================================"
