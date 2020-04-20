FROM "jupyter/minimal-notebook"

USER root

ENV JULIA_VERSION=1.4.1

RUN mkdir /opt/julia-${JULIA_VERSION} && \
    cd /tmp && \
    wget -q https://julialang-s3.julialang.org/bin/linux/x64/`echo ${JULIA_VERSION} | cut -d. -f 1,2`/julia-${JULIA_VERSION}-linux-x86_64.tar.gz && \
    tar xzf julia-${JULIA_VERSION}-linux-x86_64.tar.gz -C /opt/julia-${JULIA_VERSION} --strip-components=1 && \
    rm /tmp/julia-${JULIA_VERSION}-linux-x86_64.tar.gz

RUN ln -fs /opt/julia-*/bin/julia /usr/local/bin/julia

USER $NB_UID

# Add packages and precompile
 
RUN julia -e 'import Pkg; Pkg.update()' && \
    julia -e 'import Pkg; Pkg.add("Plots"); using Plots' && \
    julia -e 'import Pkg; Pkg.add("Distributions"); using Distributions' && \
    julia -e 'import Pkg; Pkg.add("Optim"); using Optim' && \  
    julia -e 'import Pkg; Pkg.add("FFTW"); using FFTW' && \  
    # julia -e 'import Pkg; Pkg.add("StatsPlots"); using StatsPlots' && \  
    julia -e 'import Pkg; Pkg.add("DSP"); using DSP' && \  
    julia -e 'import Pkg; Pkg.add("IJulia"); using IJulia' && \
    fix-permissions /home/$NB_USER


