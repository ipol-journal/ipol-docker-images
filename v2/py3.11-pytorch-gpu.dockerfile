FROM nvidia/cuda:11.4.3-devel-ubuntu20.04

ENV LANG C.UTF-8
ENV TORCH_CUDA_ARCH_LIST=Pascal

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

COPY packages.txt packages.txt
RUN apt-get update \
&&  apt-get install -y software-properties-common \
&& add-apt-repository ppa:deadsnakes/ppa -y \
&& apt-get update \
&& apt-get install -y python3.11-full python3.11-distutils python3.11-dev $(cat packages.txt) \
&& rm -rf /var/lib/apt/lists/*
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.11 1 \
&& update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1 \
&& ln -s /usr/lib/x86_64-linux-gnu/pkgconfig/python-3.11.pc /usr/lib/x86_64-linux-gnu/pkgconfig/python3.pc
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python get-pip.py

RUN pip install --no-cache-dir pip==24.0

COPY requirements-py3.11.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.4.550/quarto-1.4.550-linux-amd64.deb \
&& dpkg -i quarto-1.4.550-linux-amd64.deb \
&& rm quarto-1.4.550-linux-amd64.deb

RUN pip install --no-cache-dir torch==2.2.0 torchvision==0.17.0 torchaudio==2.2.0 xformers==0.0.24 --index-url https://download.pytorch.org/whl/cu118
RUN pip install --no-cache-dir pytorch-lightning==2.2.0
