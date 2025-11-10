# Menú para ejecutar INFO / BACKUP / CLEAN

while true; do
  clear
  echo "===== MENU TIF ====="
  echo "1) INFO   (informe del sistema)"
  echo "2) BACKUP (comprimir carpeta)"
  echo "3) CLEAN  (limpieza básica)"
  echo "0) Volver/Salir"
  echo "===================="
  read -p "Opción: " op

  case "$op" in
    1) ./info.sh ;;
    2) ./backup.sh ;;
    3) ./clean.sh ;;
    0) echo "Chau!"; exit 0 ;;
    *) echo "Opción inválida" ;;
  esac

  read -p $'\nPresioná ENTER para volver al menú...'
done
