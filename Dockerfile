FROM ubuntu:latest
RUN apt update -y
RUN apt upgrade -y
RUN apt -y install ffmpeg pip

RUN pip install schedule yt-dlp spotdl

WORKDIR /app
RUN mkdir songs

COPY main.py .

ENTRYPOINT [ "python3", "main.py" ]