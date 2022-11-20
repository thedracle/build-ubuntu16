FROM ubuntu:16.04

RUN apt-get update && apt-get install -y curl
RUN apt-get install build-essential -y

WORKDIR /tmp

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
COPY ./hello-world /tmp/hello-world
WORKDIR /tmp/hello-world
RUN cargo build --release
