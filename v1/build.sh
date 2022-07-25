#!/usr/bin/env bash

set -eu

docker build . -f py3.7.dockerfile -t ipol:v1-py3.7
docker build . -f py3.8.dockerfile -t ipol:v1-py3.8
docker build . -f py3.9.dockerfile -t ipol:v1-py3.9

docker build . -f py3.7-tensorflow.dockerfile -t ipol:v1-py3.7-tensorflow
docker build . -f py3.8-tensorflow.dockerfile -t ipol:v1-py3.8-tensorflow
docker build . -f py3.9-tensorflow.dockerfile -t ipol:v1-py3.9-tensorflow

docker build . -f py3.7-pytorch.dockerfile -t ipol:v1-py3.7-pytorch
docker build . -f py3.8-pytorch.dockerfile -t ipol:v1-py3.8-pytorch
docker build . -f py3.9-pytorch.dockerfile -t ipol:v1-py3.9-pytorch

docker build . -f octave.dockerfile -t ipol:v1-octave
