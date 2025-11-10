#Muestra info básica del sistema y la guarda en logs/

mkdir -p logs
LOG="logs/info-$(date '+%Y%m%d-%H%M%S').log"

echo "===== INFORME DEL SISTEMA $(date) =====" >> "$LOG"
lsb_release -a 2>>"$LOG" || cat /etc/os-release >> "$LOG"
echo >> "$LOG"

echo "--- Kernel ---" >> "$LOG"
uname -r >> "$LOG"
echo >> "$LOG"

echo "--- CPU ---" >> "$LOG"
lscpu >> "$LOG" 2>/dev/null
echo >> "$LOG"

echo "--- Memoria ---" >> "$LOG"
free -h >> "$LOG"
echo >> "$LOG"

echo "--- Disco ---" >> "$LOG"
df -h >> "$LOG"

echo "Informe generado en: $LOG"
