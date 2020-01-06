A simple docker image containing jupyter and julia with few packages. 

The image is based on [jupyter/minimal-notebook](https://github.com/jupyter/docker-stacks) and contains: `Plots.jl`, `Optim.jl`, `Distributions.jl`, `StatsPlots.jl` and  `IJulia.jl`.

- Download the folder by pressing the green button 
- Create the docker image by typing in a terminal and in the `julia_notebook` folder:
```bash
docker build --tag julia .
```
- Create the working folder `~/work`
- Run the container:
```bash
docker run -v ~/work:/home/jovyan/work -p 8888:8888 julia
```
- Follow the instructions!

