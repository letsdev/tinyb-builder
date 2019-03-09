FROM openjdk:8-jdk-alpine

RUN apk add cmake make git g++ musl-dev libusb-dev glib-dev

WORKDIR /opt

RUN git clone https://github.com/intel-iot-devkit/tinyb.git

WORKDIR /opt/tinyb

RUN mkdir build \
    && cd build \
    && cmake .. -DBUILDJAVA=ON -DCMAKE_INSTALL_PREFIX=/opt/tinyb-out \
    && make \
    && make install

RUN mv /opt/tinyb-out/lib/java/* /opt/tinyb-out/lib64

