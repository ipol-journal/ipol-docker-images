FROM python:3.11-bookworm

RUN pip install --no-cache-dir pip==24.0

COPY packages.txt packages.txt
RUN apt-get update && apt-get install -y $(cat packages.txt) && rm -rf /var/lib/apt/lists/*

COPY requirements-py3.11.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.4.550/quarto-1.4.550-linux-amd64.deb \
&& dpkg -i quarto-1.4.550-linux-amd64.deb \
&& rm quarto-1.4.550-linux-amd64.deb

RUN pip install --no-cache-dir torch==2.2.0+cpu torchvision==0.17.0+cpu torchaudio==2.2.0+cpu --index-url https://download.pytorch.org/whl/cpu
RUN pip install --no-cache-dir pytorch-lightning==2.2.0
