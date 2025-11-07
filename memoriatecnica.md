# 🧩 MEMORIA TÉCNICA – TRABAJO FINAL DE SISTEMAS OPERATIVOS  

** Teo Cagnolo – Germán Rodríguez **


---

## 1️⃣ Introducción  
El presente trabajo final tiene como propósito demostrar el uso de comandos, scripting y automatización en sistemas GNU/Linux, aplicando conocimientos teóricos en un entorno virtual controlado.  
Se desarrollaron tres scripts principales escritos en Bash que permiten realizar tareas de mantenimiento del sistema, entre ellas: generación de informes, creación de copias de seguridad y limpieza de archivos temporales.  
El entorno de pruebas fue implementado en una máquina virtual **Ubuntu 32-bit** bajo **VirtualBox**, asegurando independencia del sistema anfitrión.

---

## 2️⃣ Requisitos Técnicos  
El entorno de trabajo se configuró sobre una máquina virtual con las siguientes especificaciones:  
- Sistema operativo: **Ubuntu 22.04 LTS (32 bits)**  
- Procesador: **2 núcleos asignados**  
- Memoria RAM: **2 GB**  
- Espacio en disco: **20 GB (dinámico)**  
- Entorno de terminal: **Bash 5.1**  
- Virtualizador: **VirtualBox**


---

## 3️⃣ Desarrollo del Proyecto  
El sistema desarrollado se estructura en una carpeta principal llamada `tif-bash`, que contiene los scripts y los archivos de registro (logs).  
Los componentes principales son:

- **main.sh:** Implementa un menú interactivo que permite ejecutar las diferentes funciones del sistema.  
- **sysreport.sh:** Genera un informe detallado del estado del sistema, incluyendo uso de CPU, memoria, disco y procesos activos.  
- **backup.sh:** Automatiza la creación de copias comprimidas de seguridad y elimina las más antiguas para mantener espacio libre.  
- **clean.sh:** Realiza limpieza de archivos temporales del sistema y del usuario, liberando espacio innecesario.  

Cada script incluye registros en la carpeta `/logs` que documentan las acciones realizadas y posibles errores.  
La ejecución general se controla mediante permisos (`chmod +x`) y se inicia con el comando:
```bash
./main.sh
