# build on top of base node image
FROM node:16.16.0

# install libraries required by IPG Lock
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    libusb-0.1-4

# download and compile python
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    libreadline-gplv2-dev libncursesw5-dev libssl-dev \
    libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev
WORKDIR /opt
RUN wget https://www.python.org/ftp/python/3.8.0/Python-3.8.0.tgz
RUN tar xzf Python-3.8.0.tgz
WORKDIR /opt/Python-3.8.0
RUN ./configure --enable-optimizations
RUN make altinstall

# install pip
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3.8 get-pip.py
