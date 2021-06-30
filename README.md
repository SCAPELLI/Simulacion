# Trabajo Practico TDL 

### Integrantes
    - Hugo Larrea
    - Diego Balestieri
    - Sebita :3

### Docker 

Para ejecutar la aplicacion con Docker seguir los siguientes pasos: 

```
 sudo docker build -t tdl .
 sudo docker run -it --rm -p 3000:3000 tdl /bin/bash
```
Una vez dentro del contenedor ejecutar: 

```
./init.sh
```

De tener problemas en correr el shell script, salir del container y ejecutar: 

```
sudo chmod +x init.sh
```
Correr nuevamente el docker y volver a intentar. 

### Inicializar variables de entorno

Para las variables de se usa figaro. Dentro del docker correr 
```
./init_and_config.sh
```
Se creara un archivo config/application.yml, dentro de el
se debera crear la variable de entoro de TMDB_API_KEY

```
TMDB_API_KEY: <API_KEY>
```