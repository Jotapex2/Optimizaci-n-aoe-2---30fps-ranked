# Sesion Final - 2026-04-03

## Problema observado
- El perfil que antes habia llegado a `1000+` puntos quedo incoherente.
- Los scripts mezclaban varios perfiles: `1080p`, `1440x810`, `30%` y `1434x758`.
- Eso hacia imposible saber cual era el perfil real ganador.

## Correcciones realizadas
- Se unifico toda la carpeta al perfil probado:
  - `1434x758`
  - `Render Scale 40%`
  - `gamemoderun`
  - `WINEFSYNC=1`
  - `mesa_glthread=true`
- Se simplifico `tunear_aoe2.sh` para que no vuelva a sobrescribir otros scripts.
- Se dejo `aoe2_ultra_benchmark.sh` escribiendo solo el `dxvk.conf` minimo y probado.

## Caida temporal a 970
- Despues de la correccion, el benchmark quedo en `970`.
- Reviso del sistema:
  - `LaunchOptions` de Steam: correctas
  - `dxvk.conf`: correcto
  - Gobernador CPU: `performance`
  - `swappiness`: `100`
  - Problema real: no habia ZRAM activa

## Recuperacion final
Se reaplico:

```bash
sudo bash /home/juan/Escritorio/AOE2_Ultra_Tuning/aoe2_ultra_benchmark.sh
```

Verificacion posterior:

```bash
swapon --show
```

Resultado esperado:
- `/dev/zram0` activo
- Perfil ganador recuperado
- Benchmark nuevamente en rango ganador

## Archivos canonicos
- `aoe2_optimize.sh`
- `aoe2_ultra_benchmark.sh`
- `tunear_aoe2.sh`
- `AOE2_FINAL_SUCCESS_LOG.md`
- `AOE2_ULTRA_OPTIMIZATION_2026.md`
- `instrucciones.txt`

## Regla operativa final
Si AoE2 vuelve a perder rendimiento:
1. Reaplicar `tunear_aoe2.sh`
2. Verificar ZRAM
3. Confirmar `Render Scale 40%`
4. Confirmar overlay de Steam desactivado
5. Confirmar `dxvk.conf` limpio
