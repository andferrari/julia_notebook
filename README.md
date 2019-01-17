A simple docker image containing  jupyter and julia with few packages. 

The image is based on [jupyter/minimal-notebook](https://github.com/jupyter/docker-stacks) and contains: `Plots.jl`, `PlotlyJS.jl`, `Optim.jl`, `Distributions.jl` and  `IJulia.jl`.

Create the image:

```julia
docker build --tag julia .
```

Run the container with working folder `~/work`:

```julia
docker run -v ~/work:/home/jovyan/work -p 8888:8888 julia
```

