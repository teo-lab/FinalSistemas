# Script que elimina archivos temporales, cachés del usuario y de navegadores web (Firefox, Chrome, Chromium).
# Además genera un archivo log con el detalle de las acciones realizadas.


# Crea la carpeta "logs" si no existe.
mkdir -p logs

# Genera un nombre único para el archivo log con fecha y hora actual.
LOG="logs/clean-$(date '+%Y%m%d-%H%M%S').log"

# Escribe el encabezado del log con la fecha del proceso.
echo "===== LIMPIEZA $(date) =====" > "$LOG"

# Informa por pantalla (y también en el log) que se limpiará /tmp.
echo "Limpiando /tmp ..." | tee -a "$LOG"

# Busca y elimina solo archivos dentro de /tmp (no carpetas).
# -type f = solo archivos
# -print = muestra los nombres antes de borrarlos
# -delete = los elimina definitivamente
# 2>>"$LOG" redirige los errores (si los hay) al archivo log.
find /tmp -type f -print -delete 2>>"$LOG"


# Si existe la carpeta de caché del usuario, borra todo su contenido.
if [ -d "$HOME/.cache" ]; then
  echo "Limpiando $HOME/.cache ..." | tee -a "$LOG"
  rm -rf "$HOME/.cache"/* 2>>"$LOG"
fi

# Firefox 
# En Linux, el caché de Firefox se encuentra dentro de ~/.cache/mozilla/ este bloque elimina todos los archivos de esa carpeta.
if [ -d "$HOME/.cache/mozilla" ]; then
  echo "Limpiando cache de Firefox ..." | tee -a "$LOG"
  rm -rf "$HOME/.cache/mozilla/"* 2>>"$LOG"
fi

# Chromium / Google Chrome 
# Se recorren las rutas de caché de ambos navegadores, si existen, se eliminan todos los archivos dentro.
for d in "$HOME/.cache/chromium" "$HOME/.cache/google-chrome"; do
  if [ -d "$d" ]; then
    echo "Limpiando cache de navegador en $d ..." | tee -a "$LOG"
    rm -rf "$d"/* 2>>"$LOG"
  fi
done
echo "✅ Limpieza finalizada. Log: $LOG"
