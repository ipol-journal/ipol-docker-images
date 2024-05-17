#!/usr/bin/env bash

set -eu

registry=registry.ipol.im

docker build . -f py3.9.dockerfile -t $registry/ipol:v2-py3.9
docker build . -f py3.9-pytorch.dockerfile -t $registry/ipol:v2-py3.9-pytorch
docker build . -f py3.9-tensorflow.dockerfile -t $registry/ipol:v2-py3.9-tensorflow

docker build . -f py3.10.dockerfile -t $registry/ipol:v2-py3.10
docker build . -f py3.10-pytorch.dockerfile -t $registry/ipol:v2-py3.10-pytorch
docker build . -f py3.10-tensorflow.dockerfile -t $registry/ipol:v2-py3.10-tensorflow

docker build . -f py3.11.dockerfile -t $registry/ipol:v2-py3.11
docker build . -f py3.11-pytorch.dockerfile -t $registry/ipol:v2-py3.11-pytorch
docker build . -f py3.11-tensorflow.dockerfile -t $registry/ipol:v2-py3.11-tensorflow

docker build . -f py3.11-gpu.dockerfile -t $registry/ipol:v2-py3.11-gpu
docker build . -f py3.11-pytorch-gpu.dockerfile -t $registry/ipol:v2-py3.11-pytorch-gpu
docker build . -f py3.10-tensorflow-gpu.dockerfile -t $registry/ipol:v2-py3.10-tensorflow-gpu

docker build . -f octave.dockerfile -t $registry/ipol:v2-octave

for i in $registry/ipol:v2-{py3.{9,10,11}{,-tensorflow,-pytorch},octave} $registry/ipol:v2-py3.11-gpu $registry/ipol:v2-py3.11-pytorch-gpu $registry/ipol:v2-py3.10-tensorflow-gpu; do
    docker push "$i"
done
