# build on top of base node image
FROM node:20.9.0

# install libraries required by IPG Lock
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    libusb-0.1-4

# download and compile python
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential

RUN apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev -y
WORKDIR /opt
RUN wget https://www.python.org/ftp/python/3.8.0/Python-3.8.0.tgz
RUN tar xzf Python-3.8.0.tgz
WORKDIR /opt/Python-3.8.0
RUN ./configure --enable-optimizations
RUN make -j 8
RUN make altinstall

# install pip
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3.8 get-pip.py

# install latest npm
RUN npm install -g npm@latest