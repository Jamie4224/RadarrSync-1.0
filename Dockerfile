FROM python:3-alpine

WORKDIR /usr/src/app
COPY RadarrSync.py .
COPY requirements.txt .
COPY startup.sh

COPY Config.default /config

RUN  pip install -r requirements.txt && chmod 755 /startup.sh

ENTRYPOINT [ "sh","/startup.sh" ]
