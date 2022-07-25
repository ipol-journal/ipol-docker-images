FROM debian:bullseye

COPY packages.txt packages.txt
RUN apt-get update && apt-get install -y $(cat packages.txt) octave octave-image octave-signal octave-control octave-io octave-optim octave-statistics && rm -rf /var/lib/apt/lists/* && rm packages.txt

