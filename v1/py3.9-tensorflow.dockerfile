FROM python:3.9

RUN pip install --no-cache-dir pip==22.0.4

COPY packages.txt packages.txt
RUN apt-get update && apt-get install -y $(cat packages.txt) && rm -rf /var/lib/apt/lists/*

COPY requirements-py3.9.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v0.9.106/quarto-0.9.106-linux-amd64.deb \
&& dpkg -i quarto-0.9.106-linux-amd64.deb \
&& rm quarto-0.9.106-linux-amd64.deb

RUN pip install --no-cache-dir tensorflow-cpu==2.8.0
