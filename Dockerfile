FROM python:3-alpine

WORKDIR /usr/src/app
RUN mkdir -p config

COPY RadarrSync.py .
COPY requirements.txt .
COPY startup.sh .
COPY Config.default .

RUN  pip install -r requirements.txt && chmod 755 /usr/src/app/startup.sh

ENTRYPOINT [ "sh","/usr/src/app/startup.sh" ]
