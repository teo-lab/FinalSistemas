#!/bin/bash
# ===== clean.sh =====
# Limpia temporales del sistema y del usuario

LOG="logs/clean.log"
TEMP_PATHS=("/tmp" "$HOME/.cache")

echo "==== LIMPIEZA DEL SISTEMA ($(date '+%Y-%m-%d %H:%M:%S')) ====" >> "$LOG"

for path in "${TEMP_PATHS[@]}"; do
  if [ -d "$path" ]; then
    TAM_AN=$(du -sh "$path" 2>/dev/null | cut -f1)
    rm -rf "${path:?}"/*
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Limpieza de $path (liberado $TAM_AN)" >> "$LOG"
  fi
done

echo "✅ Limpieza completada. Detalles en $LOG"
