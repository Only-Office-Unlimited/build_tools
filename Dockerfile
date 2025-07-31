FROM ubuntu:20.04

ENV TZ=Etc/UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y update && \
    apt-get -y install python3 \
                       python3-pip \
                       python3-venv \
                       sudo
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1

ADD . /build_tools
WORKDIR /build_tools

CMD ["sh", "-c", "cd tools/linux && python3 ./automate.py"]
