# Comprime una carpeta en un .tar.gz (simple, sin rotación)

SRC="${SRC:-$HOME/proyectos/datos_prueba}"
DEST="${DEST:-$HOME/proyectos/TIF-backups}"

mkdir -p "$SRC" "$DEST"
ARCHIVE="$DEST/backup-$(date '+%Y%m%d-%H%M%S').tar.gz"

echo "Creando backup de: $SRC"
tar -czf "$ARCHIVE" -C "$SRC" .
if [ -s "$ARCHIVE" ]; then
  echo "Backup OK: $ARCHIVE"
else
  echo "Error: el backup quedó vacío o falló."
fi
