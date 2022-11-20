FROM ubuntu:16.04

RUN apt-get update && apt-get install -y curl
RUN apt-get install build-essential -y

WORKDIR /tmp

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN apt install -y g++-arm-linux-gnueabihf g++-arm-linux-gnueabi libc6-dev-armhf-cross
RUN rustup target add armv7-unknown-linux-musleabihf
COPY ./hello-world /tmp/hello-world
WORKDIR /tmp/hello-world
ENV CARGO_TARGET_ARMV7_UNKNOWN_LINUX_MUSLEABIHF_LINKER=arm-linux-gnueabihf-gcc
RUN cargo build --release --target armv7-unknown-linux-musleabihf
