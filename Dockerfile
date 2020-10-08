# syntax = docker/dockerfile:experimental
FROM python:3.8

#--mount=type=cache,target=/var/cache/apt --mount=type=cache,target=/var/lib/apt \ 
RUN    apt update && \
    apt install --assume-yes --no-install-recommends \
    build-essential \
    cmake \
    git \
    gfortran \
    libopenblas-dev \
    liblapack-dev 

RUN --mount=type=cache,target=/root/.cache/pip pip3 install --upgrade pip
RUN --mount=type=cache,target=/root/.cache/pip pip3 install dlib \ 
    opencv-python==4.3.0.38 \
    imutils \ 
    scipy 

#RUN git clone https://github.com/poojavinod100/People-Counting-Crowd-Density-Detection

COPY ./count-repo .
