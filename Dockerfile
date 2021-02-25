FROM severeone/golang:latest

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    make \
    git \
    zlib1g-dev \
    gperf \
    php-cli \
    cmake

RUN git clone https://github.com/tdlib/td.git
RUN rm -rf td/build && mkdir -p td/build

WORKDIR td/build

RUN cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local ..
RUN cmake --build . --target install

RUN cd ../../ && rm -rf td
