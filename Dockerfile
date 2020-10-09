# syntax = docker/dockerfile:experimental
FROM --platform=arm64 continuumio/miniconda3:latest

# RUN --mount=type=cache,target=/var/cache/apt --mount=type=cache,target=/var/lib/apt \ 
#     apt update && \
#     apt install --assume-yes --no-install-recommends \
#     build-essential \
#     cmake \
#     git \
#     gfortran \
#     libopenblas-dev \
#     liblapack-dev 

# RUN --mount=type=cache,target=/root/.cache/pip pip3 install --upgrade pip
# RUN --mount=type=cache,target=/root/.cache/pip pip3 install scikit-build 
# RUN --mount=type=cache,target=/root/.cache/pip pip3 install cmake 
# RUN --mount=type=cache,target=/root/.cache/pip pip3 install dlib
# RUN --mount=type=cache,target=/root/.cache/pip pip3 install opencv-python
# RUN --mount=type=cache,target=/root/.cache/pip pip3 install imutils
# RUN --mount=type=cache,target=/root/.cache/pip pip3 install scipy
RUN --mount=type=cache,target=/root/miniconda3/pkgs conda update --a
RUN --mount=type=cache,target=/root/miniconda3/pkgs conda install scipy 
RUN --mount=type=cache,target=/root/miniconda3/pkgs conda install -c conda-forge imutils opencv dlib
RUN yes | conda clean --a 

#RUN git clone https://github.com/poojavinod100/People-Counting-Crowd-Density-Detection

COPY ./count-repo .
