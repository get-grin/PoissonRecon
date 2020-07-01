FROM ubuntu:18.04

RUN apt-get update && apt-get install -q -y \
    build-essential \
    python \
    python-numpy \
    git \
    g++ \
    libeigen3-dev \
    qt5-qmake \
    qtscript5-dev \
    libqt5xmlpatterns5-dev \
    libqt5opengl5-dev \
    assimp-utils \
    nano \
    xvfb \
    && rm -rf /var/lib/apt/lists/*

RUN cd PoissonRecon && make all
ADD . /Poissonrecon
RUN cd PoissonRecon && make all
WORKDIR PoissonRecon

ENTRYPOINT ["/bin/bash"]
