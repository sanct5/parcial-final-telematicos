# Proyecto Final de Telemáticos: Servidor Web Seguro con Apache y Docker

Este proyecto implementa un servidor web seguro utilizando **Apache** con **SSL** y **Flask**, todo gestionado dentro de contenedores Docker. Además, se incluye una base de datos **MySQL** que interactúa con el servidor web.

## Requisitos previos

Antes de ejecutar el proyecto, asegúrate de tener instalados los siguientes componentes en tu sistema:

- [Vagrant](https://www.vagrantup.com/downloads)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
  
## Ejecución del Proyecto

Para ejecutar el servidor web seguro, sigue estos pasos:

1. Clona el repositorio en tu máquina local

2. Inicia la máquina virtual con **Vagrant**:
    ```bash
    vagrant up
    ```

   Esto aprovisionará automáticamente la máquina virtual, instalará Docker y montará los contenedores necesarios:
   - **Apache** con SSL y el servidor web en **Flask**.
   - **MySQL** como base de datos del servidor web.

3. Podrás acceder con ssh a cualquiera de los dos contenedores:
    ```bash
    sudo docker exec -it dockerwebapp-webapp-1 /bin/bash
    ```

    ```bash
    sudo docker exec -it dockerwebapp-db-1 /bin/bash
    ```

## Acceso al Servidor

Una vez que la máquina virtual esté en funcionamiento, podrás acceder al servidor web desde tu navegador escribiendo:

```bash
https://192.168.50.2
```

> ⚠️ **Nota:** Si intentas acceder a través de una conexión no segura (`http`), serás redireccionado automáticamente a la versión segura (`https`).

Una vez iniciado el proyecto, puedes acceder a los siguientes servicios:

- **Prometheus**:
  Interfaz de Prometheus para consultar las métricas recolectadas de los servidores y aplicaciones.
  ```bash
  http://192.168.50.2:9090
  ```
- **Node Exporter**:
  Proporciona métricas del sistema host, como uso de CPU, memoria, disco, y red.
  ```bash
  http://192.168.50.2:9100/metrics
  ```


- **Grafana**:
  Visualización gráfica de las métricas. Las credenciales iniciales para ingresar son generalmente **admin/admin** (deberías cambiarlas en el primer acceso).
  ```bash
  http://192.168.50.2:3000
  ```
  
## Información sobre métricas

- **Uso de CPU (node_cpu_seconds_total)**:  
  Esta métrica muestra el tiempo total que la CPU ha estado en diferentes modos, como user, system, idle, etc., en segundos. Cada modo indica una actividad específica:

  - `user`: tiempo que la CPU ha dedicado a procesos de usuario.
  - `system`: tiempo utilizado para procesos del sistema (núcleo).
  - `idle`: tiempo en que la CPU no estaba realizando ninguna tarea.

  El monitoreo del uso de CPU permite detectar cuellos de botella o picos de uso que pueden afectar el rendimiento del sistema. Por ejemplo, si la CPU pasa demasiado tiempo en `user` o `system`, podría indicar una sobrecarga en los procesos.

  ![image](https://github.com/user-attachments/assets/bce7c7f3-47b9-48c8-84fa-1bb383228864)

- **Memoria disponible (node_memory_MemAvailable_bytes)**:  
  Representa la cantidad de memoria libre y fácilmente disponible para nuevas aplicaciones sin necesidad de paginación. En sistemas con mucha actividad, esta métrica es crucial para evaluar si hay suficiente memoria disponible para satisfacer las demandas de las aplicaciones sin recurrir al intercambio de datos al disco, que es una operación más lenta. Si esta métrica disminuye constantemente, podría ser necesario optimizar los procesos o aumentar la memoria física.

  ![image](https://github.com/user-attachments/assets/c55d1815-d78c-4989-b976-79e99cff601a)

- **Espacio en disco (node_filesystem_avail_bytes)**:
  Indica el espacio de almacenamiento disponible en bytes en el sistema de archivos. Es importante para monitorear el uso de disco y evitar que el sistema quede sin espacio, lo cual podría causar la falla de  aplicaciones y procesos críticos. Por ejemplo, monitorear el espacio en disco permite prever cuándo un sistema está por alcanzar su capacidad máxima, de modo que se pueda limpiar, archivar o agregar almacenamiento antes de que surjan problemas.

  ![image](https://github.com/user-attachments/assets/3266850f-dbbd-495b-8358-fbf53f0ce35b)

## Dashboards en Grafana

En Grafana, es posible visualizar métricas recolectadas de los sistemas en tiempo real. A continuación, se presentan ejemplos de paneles configurados:

- Panel con métricas como el uso de CPU y la memoria disponible, incluyendo un medidor de estado (gauge) que muestra el espacio en disco disponible. Esta configuración permite monitorear el estado de los recursos de forma intuitiva y detallada.

  ![image](https://github.com/user-attachments/assets/5e23d44b-8828-4acf-8afa-730110f2ef1a)
  
- Panel completo de **Node Exporter Full** en Grafana, que muestra un conjunto más amplio de métricas recolectadas por el Node Exporter, facilitando un análisis exhaustivo de los recursos del sistema.

  ![image](https://github.com/user-attachments/assets/a59606de-9c25-4567-a1a0-679453e137a5)
