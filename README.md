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

## Acceso al Servidor

Una vez que la máquina virtual esté en funcionamiento, podrás acceder al servidor web desde tu navegador escribiendo:

```bash
https://192.168.50.2
```

> ⚠️ **Nota:** Si intentas acceder a través de una conexión no segura (`http`), serás redireccionado automáticamente a la versión segura (`https`).