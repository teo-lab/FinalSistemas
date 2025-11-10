#Script que muestra la informacion basica del sistema y la guarda en logs.

#Crea la carpeta logs si no hay una.
mkdir -p logs
LOG="logs/info-$(date '+%Y%m%d-%H%M%S').log"

#Sistema OP.
echo "===== INFORME DEL SISTEMA $(date) =====" >> "$LOG"
lsb_release -a 2>>"$LOG" || cat /etc/os-release >> "$LOG"
echo >> "$LOG"

# Kernel.
echo "--- Kernel ---" >> "$LOG"
uname -r >> "$LOG"
echo >> "$LOG"

# CPU.
echo "--- CPU ---" >> "$LOG"
lscpu >> "$LOG" 2>/dev/null
echo >> "$LOG"

# Memoria.
echo "--- Memoria ---" >> "$LOG"
free -h >> "$LOG"
echo >> "$LOG"

# Disco.
echo "--- Disco ---" >> "$LOG"
df -h >> "$LOG"

echo "Informe generado en: $LOG"

