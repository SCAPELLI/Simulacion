# Trabajo Practico TDL 

### Integrantes
    - Hugo Larrea
    - Diego Balestieri
    - Sebastián Capelli


### Inicializar variables de entorno

Para las variables de se usa figaro. Dentro del contenedor de Docker se debera ejecutar 

```
./init_and_config.sh
```

Se creara un archivo config/application.yml, dentro de el
se debera crear la variable de entoro de TMDB_API_KEY

```
TMDB_API_KEY: <API_KEY>
```
### Docker 

Para ejecutar la aplicacion con Docker seguir los siguientes pasos: 

```
./docker.sh
```
Una vez dentro del contenedor ejecutar: 

```
./init.sh
```

De tener problemas en correr el shell script, salir del container y ejecutar: 

```
sudo chmod +x init.sh
```
Correr nuevamente ambos comandos.

Link a drive: https://drive.google.com/drive/folders/1BVO3oN8KRJSFuu29OmE64tZ8ZJuXVCeA?usp=sharing
