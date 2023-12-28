# edp-2023-recursado-tp

## generador

```
$ cd 01-generador/
$ docker build -t generador .
$ docker run -v $(pwd)/../outputs_gen:/app/outputs -it generador
```

## usuario

```
$ cd 02-usuario/
$ docker build -t usuario .
$ docker run -v $(pwd)/../outputs_gen:/app/inputs -v $(pwd)/../textos:/app/textos -v $(pwd)/../outputs_usuario:/app/outputs -it usuario
```
