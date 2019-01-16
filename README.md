Simple docker image containing  jupyter and julia. The image is based on [jupyter/minimal-notebook](https://github.com/jupyter/docker-stacks).

Create image:

```julia
docker build --tag julia .
```

Run the container:

```julia
docker run -v ~/work:/home/jovyan/work -p 8888:8888 julia
```

