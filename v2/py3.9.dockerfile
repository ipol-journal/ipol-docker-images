FROM python:3.9-bookworm

RUN pip install --no-cache-dir pip==24.0

COPY packages.txt packages.txt
RUN apt-get update && apt-get install -y $(cat packages.txt) && rm -rf /var/lib/apt/lists/*

COPY requirements-py3.9.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.4.550/quarto-1.4.550-linux-amd64.deb \
&& dpkg -i quarto-1.4.550-linux-amd64.deb \
&& rm quarto-1.4.550-linux-amd64.deb
