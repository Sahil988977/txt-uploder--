FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y gcc libffi-dev ffmpeg aria2 && \
    apt-get clean

COPY . /app
WORKDIR /app

RUN pip install --no-cache-dir -r requirements.txt
RUN pip install pytube

ENV COOKIES_FILE_PATH="youtube_cookies.txt"

CMD ["python", "main.py"]
