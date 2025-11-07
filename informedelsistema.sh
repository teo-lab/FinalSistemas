# Genera un informe del sistema con CPU, RAM, Disco y procesos activos

LOG="logs/system_report.log"

echo "==== INFORME DEL SISTEMA ($(date '+%Y-%m-%d %H:%M:%S')) ====" >> "$LOG"
echo "Hostname: $(hostname)" >> "$LOG"
echo "Uptime: $(uptime -p)" >> "$LOG"
echo "Versión del SO: $(lsb_release -d | cut -f2)" >> "$LOG"
echo "" >> "$LOG"
echo "Uso de CPU:" >> "$LOG"
top -bn1 | grep "Cpu(s)" >> "$LOG"
echo "" >> "$LOG"
echo "Uso de Memoria:" >> "$LOG"
free -h >> "$LOG"
echo "" >> "$LOG"
echo "Espacio en Disco:" >> "$LOG"
df -h / >> "$LOG"
echo "" >> "$LOG"
echo "Procesos activos (Top 5):" >> "$LOG"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6 >> "$LOG"
echo "=============================================================" >> "$LOG"
echo "" >> "$LOG"

echo "✅ Informe generado y guardado en $LOG"
