FROM "jupyter/minimal-notebook"

USER root

ENV JULIA_VERSION=1.0.3

RUN mkdir /opt/julia-${JULIA_VERSION} && \
    cd /tmp && \
    wget -q https://julialang-s3.julialang.org/bin/linux/x64/`echo ${JULIA_VERSION} | cut -d. -f 1,2`/julia-${JULIA_VERSION}-linux-x86_64.tar.gz && \
    tar xzf julia-${JULIA_VERSION}-linux-x86_64.tar.gz -C /opt/julia-${JULIA_VERSION} --strip-components=1 && \
    rm /tmp/julia-${JULIA_VERSION}-linux-x86_64.tar.gz

RUN ln -fs /opt/julia-*/bin/julia /usr/local/bin/julia

USER $NB_UID

# Add Julia packages
 
RUN julia -e 'import Pkg; Pkg.update()' && \
    julia -e 'import Pkg; Pkg.add("Plots")' && \
    julia -e 'import Pkg; Pkg.add("PlotlyJS")' && \
    julia -e 'import Pkg; Pkg.add("Distributions")' && \
    julia -e 'import Pkg; Pkg.add("Optim")' && \    
    julia -e 'import Pkg; Pkg.add("IJulia")' && \
    julia -e 'using IJulia' && \
    fix-permissions /home/$NB_USER


