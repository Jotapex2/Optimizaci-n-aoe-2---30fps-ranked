# AoE2:DE - Log Final de Optimizacion (1000+ Puntos)
**Estado actual:** Mision cumplida. Perfil ganador restaurado y validado.
**Hardware:** Intel Core i5-7200U (7th Gen) | Intel HD 620 Graphics
**Fecha:** viernes, 3 de abril de 2026

---

## Configuracion ganadora (Steam)
Copia y pega esto exactamente en las opciones de lanzamiento:

```bash
WINE_FULLSCREEN_FSR=1 WINE_FULLSCREEN_FSR_CUSTOM_MODE=1434x758 WINE_FULLSCREEN_FSR_STRENGTH=5 gamemoderun mesa_glthread=true WINEFSYNC=1 vblank_mode=0 %command% -novid -nojoy
```

**Nota vital:** desactiva el overlay de Steam en las propiedades del juego.

---

## Ajustes del sistema
Antes de jugar o despues de reiniciar, ejecutar:

```bash
sudo bash ~/Escritorio/AOE2_Ultra_Tuning/tunear_aoe2.sh
```

Este flujo deja aplicado:
- `/dev/zram0` activo en 4G con prioridad 100.
- `vm.swappiness=100`.
- Perfil DXVK minimo y probado.
- Efectos visuales del escritorio desactivados con SenseiDE.

---

## Configuracion DXVK aplicada
Archivo: `/home/juan/.steam/debian-installation/steamapps/common/AoE2DE/dxvk.conf`

```ini
dxvk.numCompilerThreads = 2
d3d11.dcSingleThreaded = True
d3d11.samplerAnisotropy = 0
```

---

## Ajustes dentro del juego
- Resolucion: `1434x758`
- Render Scale: `40%`
- V-Sync: `OFF`
- Graficos: `OFF/BAJO`

---

## Incidente resuelto
Durante la sesion final, el rendimiento cayo temporalmente de `980` a `970`.

Causa encontrada:
- La ZRAM no estaba activa, aunque `swappiness=100` y `performance` seguian aplicados.

Correccion aplicada:
- Reejecucion del perfil con `sudo bash ~/Escritorio/AOE2_Ultra_Tuning/aoe2_ultra_benchmark.sh`
- Verificacion posterior con `swapon --show`

Estado final:
- Perfil coherente restaurado.
- Launch options correctas en Steam.
- `dxvk.conf` limpio.
- ZRAM activa nuevamente.
- Benchmark recuperado.

---

**Resultado:** 1000+ puntos. Benchmark apto para Ranked.
