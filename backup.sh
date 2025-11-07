#!/bin/bash
# ===== backup.sh =====
# Crea un backup comprimido del directorio elegido y elimina los antiguos

ORIGEN="$HOME/tif-bash"
DESTINO="$HOME/backups_tif"
LOG="logs/backup.log"
DIAS_RETENCION=7

mkdir -p "$DESTINO" logs

FECHA=$(date +%Y-%m-%d_%H-%M)
ARCHIVO="$DESTINO/backup_$FECHA.tar.gz"

tar -czf "$ARCHIVO" "$ORIGEN" 2>>"$LOG"

if [ $? -eq 0 ]; then
  echo "$(date '+%Y-%m-%d %H:%M:%S') - Backup creado: $ARCHIVO" >> "$LOG"
  find "$DESTINO" -type f -name "*.tar.gz" -mtime +$DIAS_RETENCION -exec rm {} \;
  echo "$(date '+%Y-%m-%d %H:%M:%S') - Backups viejos eliminados (> $DIAS_RETENCION días)" >> "$LOG"
  echo "✅ Backup completado correctamente."
else
  echo "$(date '+%Y-%m-%d %H:%M:%S') - ❌ Error al crear backup." >> "$LOG"
  echo "❌ Error al crear backup."
fi
