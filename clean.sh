# Limpia /tmp y la cache del usuario (~/.cache)

mkdir -p logs
LOG="logs/clean-$(date '+%Y%m%d-%H%M%S').log"

echo "===== LIMPIEZA $(date) =====" >> "$LOG"

if [ -d /tmp ]; then
  echo "Limpiando /tmp ..." | tee -a "$LOG"
  rm -rf /tmp/* 2>>"$LOG"
fi

if [ -d "$HOME/.cache" ]; then
  echo "Limpiando $HOME/.cache ..." | tee -a "$LOG"
  rm -rf "$HOME/.cache"/* 2>>"$LOG"
fi

echo "Limpieza finalizada. Log: $LOG"

