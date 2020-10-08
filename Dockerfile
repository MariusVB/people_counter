# syntax = docker/dockerfile:experimental
FROM python:3.7-slim

#--mount=type=cache,target=/var/cache/apt --mount=type=cache,target=/var/lib/apt \ 
RUN    apt update && \
    apt install --assume-yes --no-install-recommends \
    build-essential \
    cmake \
    git \
    gfortran \
    libopenblas-dev \
    liblapack-dev 

RUN pip3 install --upgrade pip
RUN pip3 install scikit-build 
RUN pip3 install \
    dlib \ 
    opencv-python \
    imutils \ 
    scipy 

#RUN git clone https://github.com/poojavinod100/People-Counting-Crowd-Density-Detection

COPY ./count-repo .
