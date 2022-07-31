#!/usr/bin/env bash

set -eu

registry=registry.ipol.im

docker build . -f py3.7.dockerfile -t $registry/ipol:v1-py3.7
docker build . -f py3.8.dockerfile -t $registry/ipol:v1-py3.8
docker build . -f py3.9.dockerfile -t $registry/ipol:v1-py3.9

docker build . -f py3.7-tensorflow.dockerfile -t $registry/ipol:v1-py3.7-tensorflow
docker build . -f py3.8-tensorflow.dockerfile -t $registry/ipol:v1-py3.8-tensorflow
docker build . -f py3.9-tensorflow.dockerfile -t $registry/ipol:v1-py3.9-tensorflow

docker build . -f py3.7-pytorch.dockerfile -t $registry/ipol:v1-py3.7-pytorch
docker build . -f py3.8-pytorch.dockerfile -t $registry/ipol:v1-py3.8-pytorch
docker build . -f py3.9-pytorch.dockerfile -t $registry/ipol:v1-py3.9-pytorch

docker build . -f py3.8-gpu.dockerfile -t $registry/ipol:v1-py3.8-gpu
docker build . -f py3.8-pytorch-gpu.dockerfile -t $registry/ipol:v1-py3.8-pytorch-gpu
docker build . -f py3.8-tensorflow-gpu.dockerfile -t $registry/ipol:v1-py3.8-tensorflow-gpu

docker build . -f octave.dockerfile -t $registry/ipol:v1-octave

for i in $registry/ipol:v1-{py3.{7,8,9}{,-tensorflow,-pytorch},octave} $registry/ipol:v1-py3.8-gpu $registry/ipol:v1-py3.8-pytorch-gpu $registry/ipol:v1-py3.8-tensorflow-gpu; do
    docker push $i
done
