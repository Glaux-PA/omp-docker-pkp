# Implementación de OMP en contenedor docker para desarrollo de plugins y temas

* Actualizado a la versión 3.3.0.17
* Retocados los archivos de configuración para hacer más sencilla la implementación
* Montar carpetas de log/apache y plugins


## Pendiente:
* Script para copiar los plugins del contenedor al host de forma automatizada
  * De forma temporal, al completar la instalación, nos descargamos la versión de omp y copiamos el contenido de la carpeta plugins a la carpeta ./volumes/plugins
* Al terminar la instalación, tenemos que sobreescribir manualmente el archivo config.inc.php -> buscar una forma de automatizar este proceso



### Instrucciones:
* Descargar el repositorio
* Descargar la aplicación OMP 3.3.0.17 de la web de pkp
* Revisar los datos de configuración de .env
* Copiar el archivo "config.inc.php" de la aplicación OMP descargada(web pkp) en el contenedor -> volumnes/config/
* Lanzar el contenedor -> docker-compose up -d
* Acceder a la url -> http://localhost:8100 (u otro puerto según la config de .env HTTP_PORT)
* Revisar los permisos de los archivos y carpetas necesarios -> se mostrará una lista con los permisos y si están correctamente
* Completamos el formulario de instalación -> en el campo de BBDD es posible que en lugar de localhost tengamos que poner el nombre del servicio -> db
* Al finalizar la instalación, es posible que nos pida sobreescribir el archivo config.inc.php con el contenido de una caja de texto -> en este caso, seguir las instrucciones
* Si todo es correcto, podremos acceder al portal OMP
* Dar permisos a la carpeta volumes/plugins -> lectura y escritura
* Copiar el contenido de la aplicación descargada OMP -> plugins(todos) a la carpeta del contenedor -> volumes/plugins



##### Forked from: marcbria/docker-pkp(https://github.com/marcbria/docker-pkp)

# Docker for PKP

A docker image generator for PKP tools (aka. OJS, OMP, OPS).

This is a proof of concept to test ideas to refactor docker-ojs project.

New approach includes:

- [x] Able to generate images for different PKP tools.
- [x] Multi-stage approach.
- [x] Debian based images.
- [x] Building from tarball.

# ToDo
- [ ] gitHub Actions to build images based on commits.
- [ ] Monitor security with snyk service (or trivy).
- [ ] Dockerfile and docker-compose created from templates.
- [ ] Build and publish images for all versions.
- [ ] Create a DEV image built from git repos.
- [ ] gitHub Actions to autopush to DockerHub.
- [ ] Move from debian to debian-slim.
- [ ] Add and test "OPS" images.
- [ ] Add docker-ojs feature requests (see issues).
- [ ] Extend image with DEV tools.

# Howto

    $ git clone https://github.com/marcbria/docker-pkp.git
    $ vim .env
    $ docker-compose build --build-arg BUILD_PKP_TOOL=omp --build-arg BUILD_LABEL=$(date "+%Y%m%d-%H%M%S") --no-cache
    $ docker-compose up -d

Done.

Visit your new site at https://localhost:8089 and install with parameters found in .env

