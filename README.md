Any docker images can be used to build a demo. For example, one can use [a python base image](https://hub.docker.com/_/python) or [a debian base image](https://hub.docker.com/_/debian).

However, IPOL also proposes a few prebuilt images for Python demos (recommended). See below of the descriptions of the images.

# v2

- `registry.ipol.im/ipol:v2-py3.9`
- `registry.ipol.im/ipol:v2-py3.9-pytorch`
- `registry.ipol.im/ipol:v2-py3.9-tensorflow`
- `registry.ipol.im/ipol:v2-py3.10`
- `registry.ipol.im/ipol:v2-py3.10-pytorch`
- `registry.ipol.im/ipol:v2-py3.10-tensorflow`
- `registry.ipol.im/ipol:v2-py3.10-tensorflow-gpu`
- `registry.ipol.im/ipol:v2-py3.11`
- `registry.ipol.im/ipol:v2-py3.11-gpu`
- `registry.ipol.im/ipol:v2-py3.11-pytorch`
- `registry.ipol.im/ipol:v2-py3.11-pytorch-gpu`
- `registry.ipol.im/ipol:v2-py3.11-tensorflow`
- `registry.ipol.im/ipol:v2-octave`

## ipol:v2-py

Each image is based on the dockerhub `python:3.x-bookworm` image.
The GPU images are based on `nvidia/cuda:11.4.3-cudnn8-devel-ubuntu20.04`.

The list of preinstalled system packages is available here [v2/packages.txt](v2/packages.txt).

The list of preinstalled python packages is available here [v2/requirements-*.txt](v2/requirements-py3.11.txt) (it is the same for all Python versions).

### -pytorch

This flavor adds the following packages:
- `torch==2.2.0+cpu` (from https://download.pytorch.org/whl/cpu)
- `torchvision==0.17.0+cpu` (same)
- `torchaudio==2.2.0+cpu` (same)
- `pytorch-lightning==2.2.0`

### -tensorflow

This flavor adds the following package:
- `tensorflow==2.15.0.post1`

### -gpu

The GPU variants are a bit special. They are built on top of `nvidia/cuda:11.4.3-cudnn8-devel-ubuntu20.04` with Python installed from `ppa:deadsnakes/ppa`.

variants:
- `py3.11-gpu`: python 3.11, cuda 11.4 (from the base image)
- `py3.11-pytorch-gpu`: python 3.11, cuda 11.8, same pytorch as described above (2.2.0) but installed with cuda support (from https://download.pytorch.org/whl/cu118)
- `py3.10-tensorflow-gpu`: python 3.10, cuda 11.8, `tensorflow[and-cuda]==2.14.1`

## ipol:v2-octave

This image is based on `debian:bookworm` with the following octave packages:
```
Package Name  | Version | Installation directory
--------------+---------+-----------------------
     control  |   3.4.0 | /usr/share/octave/packages/control-3.4.0
       image  |  2.14.0 | /usr/share/octave/packages/image-2.14.0
          io  |   2.6.4 | /usr/share/octave/packages/io-2.6.4
       optim  |   1.6.2 | /usr/share/octave/packages/optim-1.6.2
      signal  |   1.4.3 | /usr/share/octave/packages/signal-1.4.3
  statistics  |   1.5.3 | /usr/share/octave/packages/statistics-1.5.3
      struct  |  1.0.18 | /usr/share/octave/packages/struct-1.0.18
```

Octave is at version 7.3.0. The packages are not loaded by default, so you must use `pkg load image` in your code for example.


<hr />

# v1

- `registry.ipol.im/ipol:v1-py3.7`
- `registry.ipol.im/ipol:v1-py3.7-pytorch`
- `registry.ipol.im/ipol:v1-py3.7-tensorflow`
- `registry.ipol.im/ipol:v1-py3.8`
- `registry.ipol.im/ipol:v1-py3.8-gpu`
- `registry.ipol.im/ipol:v1-py3.8-pytorch`
- `registry.ipol.im/ipol:v1-py3.8-pytorch-gpu`
- `registry.ipol.im/ipol:v1-py3.8-tensorflow`
- `registry.ipol.im/ipol:v1-py3.8-tensorflow-gpu`
- `registry.ipol.im/ipol:v1-py3.9`
- `registry.ipol.im/ipol:v1-py3.9-pytorch`
- `registry.ipol.im/ipol:v1-py3.9-tensorflow`
- `registry.ipol.im/ipol:v1-octave`

## ipol:v1-py

Each image is based on the dockerhub `python:3.x` image, which itself is based on Debian bullseye.
The images also contain [quarto v0.9.106](https://github.com/quarto-dev/quarto-cli/releases/tag/v0.9.106).

### System packages

The following packages are preinstalled in every IPOL images, in addition to what is already installed in the `python:3.x` base image:
```
cmake
libtiff5-dev
libjpeg-dev
libpng-dev
libfftw3-dev
liblapack-dev
libblas-dev
libopenblas-base
libopenblas-dev
libblas-dev
libblas3
liblapack-dev
liblapacke-dev
liblapacke
libconfig9
libconfig-dev
libconfig++-dev
```

### py3.7

Includes the following additional Python packages from PIP:
```
pip==22.0.4

numpy==1.21.5
scipy==1.7.3
scikit-image==0.19.2
scikit-learn==1.0.2
opencv-contrib-python-headless==4.5.5.64

pillow==9.0.1
iio==0.0.3
imageio==2.16.1
imagecodecs==2021.11.20

jupyter==1.0.0
matplotlib==3.5.1
plotly==5.6.0
pandas==1.3.5

papermill==2.3.4
```

### py3.8

Includes the following additional Python packages from PIP:
```
pip==22.0.4

numpy==1.22.3
scipy==1.8.0
scikit-image==0.19.2
scikit-learn==1.0.2
opencv-contrib-python-headless==4.5.5.64

pillow==9.0.1
iio==0.0.3
imageio==2.16.1
imagecodecs==2021.11.20

jupyter==1.0.0
matplotlib==3.5.1
plotly==5.6.0
pandas==1.4.1

papermill==2.3.4
```

### py3.9

Includes the following additional Python packages from PIP:
```
pip==22.0.4

numpy==1.22.3
scipy==1.8.0
scikit-image==0.19.2
scikit-learn==1.0.2
opencv-contrib-python-headless==4.5.5.64

pillow==9.0.1
iio==0.0.3
imageio==2.16.1
imagecodecs==2021.11.20

jupyter==1.0.0
matplotlib==3.5.1
plotly==5.6.0
pandas==1.4.1

papermill==2.3.4
```

### -pytorch

This flavor adds the following packages (from https://download.pytorch.org/whl/cpu/torch_stable.html):
- `torch==1.11.0+cpu`
- `torchvision==0.12.0+cpu`
- `torchaudio==0.11.0+cpu`

### -tensorflow

This flavor adds the following package:
- `tensorflow-cpu==2.8.0`

## ipol:v1-octave

This image is based on `debian:bullseye` with the following packages:
```
octave
octave-image
octave-signal
octave-control
octave-io
octave-optim
octave-statistics 
```

Octave is at version 6.2.0. The packages are not loaded by default, so you must use `pkg load image` in your code for example.

