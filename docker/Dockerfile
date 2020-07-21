FROM ubuntu:focal

SHELL [ "/bin/bash", "-c" ]

RUN apt-get update && \
    apt-get install -y python3-virtualenv python3-pip

COPY . /server
COPY docker/_etesync-server_init.ini /server/etesync-server.ini

RUN groupadd -r etesyncer && \
    useradd -r -m -g etesyncer etesyncer && \
    chown -R etesyncer /server

USER etesyncer

RUN cd /server && \
    virtualenv -p python3 venv && \
    source venv/bin/activate && \
    pip install -r requirements.txt

RUN /server/docker/_init.sh

USER root
WORKDIR /server
ENTRYPOINT [ "docker/_entrypoint.sh" ]
CMD [ "docker/_start-server.sh" ]
