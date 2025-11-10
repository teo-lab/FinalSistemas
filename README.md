# Trabajo Final de Sistemas Operativos – Scripts Automatizados

**Instituto Superior IDRA**  
**Tecnicatura Superior en Desarrollo de Software**  
**Alumnos:** Teo Cagnolo – Germán Rodríguez  

---

## Descripción del proyecto

Este proyecto tiene como objetivo automatizar tareas básicas de administración del sistema operativo Linux mediante el uso de scripts Bash.  
Se desarrollaron tres scripts principales —`info.sh`, `backup.sh` y `clean.sh`— y un menú principal `menu.sh` que integra todas las funciones de forma interactiva, con validación de entrada y uso de colores para mejorar la experiencia del usuario.

**Scripts desarrollados:**

- **`info.sh`** → Genera un informe del sistema y lo guarda en `logs/`.  
- **`backup.sh`** → Realiza copias de respaldo comprimidas y elimina automáticamente las más antiguas.  
- **`clean.sh`** → Limpia archivos temporales, cachés del sistema y de navegadores.  
- **`menu.sh`** → Presenta un menú interactivo con opciones numéricas y validación de entrada.

---

## Instrucciones de uso

El sistema desarrollado permite ejecutar distintas tareas de administración del sistema Linux desde un menú interactivo.  
A continuación, se detallan los pasos necesarios para clonar el repositorio, asignar los permisos de ejecución y ejecutar el menú principal, junto con ejemplos prácticos de salida.

---

### 1. Clonar o descargar el repositorio

Para obtener el proyecto, se puede clonar directamente desde GitHub utilizando el siguiente comando:
git clone https://github.com/teo-lab/FinalSistemas.git
cd FinalSistemas

### 2. Asignar permisos de ejecución
Una vez dentro del directorio del proyecto, se deben asignar permisos de ejecución a todos los archivos .sh:
chmod +x *.sh

### 3. Ejecutar el menú principal
./menu.sh

---

### 4. Ejemplos de ejecución

Opción 1 – INFO
Genera un log con información del sistema operativo, kernel, CPU, memoria y discos.
El resultado se guarda en la carpeta logs/ con la fecha y hora de ejecución:
logs/info-20251110-123045.log

Opción 2 – BACKUP
Crea un archivo comprimido (.tar.gz) en el directorio backups/ y elimina automáticamente los respaldos más antiguos:
backups/backup-20251110-123050.tar.gz

Opción 3 – CLEAN
Limpia los archivos temporales del sistema y cachés de usuario o navegadores, generando un archivo log con las acciones ejecutadas:
logs/clean-20251110-123200.log

Opción 0 – SALIR
Finaliza la ejecución del programa de manera segura y limpia.

---

## Solucion de errores comunes.

Si durante la ejecución del menú o de alguno de los scripts aparece un error como:
$'\r': orden no encontrada

Eso significa que los archivos fueron editados en un entorno Windows y contienen saltos de línea incompatibles con Linux.  
Para solucionarlo, se debe instalar la herramienta **dos2unix** y convertir los scripts al formato Unix (LF) mediante los siguientes comandos:

sudo apt install dos2unix -y
dos2unix *.sh

---

## Como colaborar?
Paso 1: Realizar un fork del repositorio

Paso 2: Crear una rama para los cambios:
git checkout -b feature/nueva-funcion

Paso 3: Subir los cambios y realizar un commit
git commit -m "Agrego nuevo script automatico"

Paso 4: Enviar un pull request para revisión.

---

MIT License  
Copyright (c) 2025  
Teo Cagnolo – Germán Rodríguez
