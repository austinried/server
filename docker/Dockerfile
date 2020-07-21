FROM ubuntu:focal

SHELL [ "/bin/bash", "-c" ]

RUN apt-get update && \
    apt-get install -y python3-virtualenv python3-pip

RUN ln -s /usr/bin/python3 /usr/bin/python && \
    ln -s /usr/bin/pip3 /usr/bin/pip

COPY . /server
COPY docker/_etesync-server_init.ini /server/etesync-server.ini

RUN cd /server && \
    virtualenv -p python3 venv && \
    source venv/bin/activate && \
    pip install -r requirements.txt

RUN /server/docker/_init.sh

WORKDIR /server
CMD [ "docker/_start-server.sh" ]
