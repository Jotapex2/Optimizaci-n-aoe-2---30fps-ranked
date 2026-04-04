# AoE2:DE - Perfil Ganador 1000+ Puntos
**Estado:** Configuracion coherente restaurada y documentada.

---

## Lanzamiento (Steam)
```bash
WINE_FULLSCREEN_FSR=1 WINE_FULLSCREEN_FSR_CUSTOM_MODE=1434x758 WINE_FULLSCREEN_FSR_STRENGTH=5 gamemoderun mesa_glthread=true WINEFSYNC=1 vblank_mode=0 %command% -novid -nojoy
```

## Ajustes del juego
- Resolucion: `1434x758`
- Render Scale: `40%`
- V-Sync: `OFF`
- Graficos: `OFF/BAJO`
- Overlay de Steam: `OFF`

## DXVK aplicado
- `dxvk.numCompilerThreads = 2`
- `d3d11.dcSingleThreaded = True`
- `d3d11.samplerAnisotropy = 0`

## Runtime del sistema
- ZRAM: `4G`
- Prioridad swap: `100`
- `vm.swappiness = 100`
- Gobernador CPU esperado: `performance`

## Comando de recuperacion
Si el benchmark baja despues de reiniciar o tocar configuracion:

```bash
sudo bash ~/Escritorio/AOE2_Ultra_Tuning/tunear_aoe2.sh
```

Luego verificar:

```bash
swapon --show
zramctl
```

---

**Objetivo:** volver siempre al mismo perfil que ya supero los 1000 puntos.
