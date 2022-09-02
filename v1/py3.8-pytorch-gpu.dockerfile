FROM nvidia/cuda:11.3.0-cudnn8-devel-ubuntu20.04

ENV LANG C.UTF-8

COPY packages.txt packages.txt
RUN apt-get update && DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y python3 python3-pip $(cat packages.txt) && rm -rf /var/lib/apt/lists/*
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1

RUN pip install --no-cache-dir pip==22.0.4

COPY requirements-py3.8.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v0.9.106/quarto-0.9.106-linux-amd64.deb \
&& dpkg -i quarto-0.9.106-linux-amd64.deb \
&& rm quarto-0.9.106-linux-amd64.deb

RUN pip install --no-cache-dir torch==1.11.0+cu113 torchvision==0.12.0+cu113 torchaudio==0.11.0 --extra-index-url https://download.pytorch.org/whl/cu113
