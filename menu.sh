#Script del Menu Interactivo
#Codigos ANSI
VERDE="\e[32m"
CIAN="\e[36m"
ROJO="\e[31m"
RESET="\e[0m"

while true; do
  clear
  # Muestra el título del menú y las opciones con colores.
  echo -e "${VERDE}===== MENU =====${RESET}"
  echo -e "${CIAN}1) INFO   (Informe del sistema)${RESET}"
  echo -e "${CIAN}2) BACKUP (Respaldo de directorio y gestion backups)${RESET}"
  echo -e "${CIAN}3) CLEAN  (Limpieza cache, archivos temporales)${RESET}"
  echo -e "${CIAN}0) SALIR${RESET}"
  echo -e "${VERDE}====================${RESET}"
  read -p "Elegí una opción (0-3): " op

  # (EXTRA) Validación de entrada (solo acepta 0,1,2,3)
  if [ "$op" != "0" ] && [ "$op" != "1" ] && [ "$op" != "2" ] && [ "$op" != "3" ]; then
    echo -e "${ROJO}⚠️  Opción inválida. Ingresá un número entre 0 y 3.${RESET}"
    sleep 1        # Espera un segundo antes de volver al menú.
    continue
  fi

  case "$op" in
    1) ./info.sh ;;         # Ejecuta el script que genera el informe del sistema.
    2) ./backup.sh ;;       # Ejecuta el script que realiza el backup automático.
    3) ./clean.sh ;;        # Ejecuta el script que limpia archivos temporales y cachés.
    0) echo -e "${VERDE}¡Hasta luego!${RESET}"; exit 0 ;;
  esac

  echo
  read -p "Presioná ENTER para volver al menú..." _
done
