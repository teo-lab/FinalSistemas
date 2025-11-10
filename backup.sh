#Scrip atomatizado Backup.
#Funcionamiento: Automatizar el respaldo de un directorio en un archivo comprimido y gestionar la eliminación de backups antiguos

# Carpeta a respaldar.
SRC="${SRC:-$HOME/proyectos/datos_prueba}"
# Carpeta donde se guardan los .tar.gz
DEST="${DEST:-$HOME/proyectos/FinalSistemas/backups}"
# Días que se conservan los backups antes de borrarse.
RETENTION_DAYS="${RETENTION_DAYS:-7}"

# Crear carpetas si no existen.
mkdir -p "$SRC" "$DEST"

# Genera un nombre único para el archivo comprimido, con la fecha y hora actual.
ARCHIVE="$DEST/backup-$(date '+%Y%m%d-%H%M%S').tar.gz"
# Muestra por pantalla qué carpeta se va a respaldar y a dónde se guardará.
echo "Creando backup de: $SRC -> $ARCHIVE"
# Crear backup comprimido.
tar -czf "$ARCHIVE" -C "$SRC" .
[ -s "$ARCHIVE" ] && echo "Backup OK" || { echo "Error en backup"; exit 1; }

# Busca en la carpeta de destino los archivos con más de 7 días de antigüedad y los elimina automáticamente.
echo "Aplicando rotación (> $RETENTION_DAYS días) en $DEST"
find "$DEST" -type f -name 'backup-*.tar.gz' -mtime "+$RETENTION_DAYS" -print -delete
