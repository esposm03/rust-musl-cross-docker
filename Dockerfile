FROM rust
RUN apt-get update && apt-get install -y gcc-x86-64-linux-gnu gcc-aarch64-linux-gnu musl-dev curl protobuf-compiler && rm -rf /var/lib/apt/lists/*
RUN rustup target add x86_64-unknown-linux-musl aarch64-unknown-linux-musl
WORKDIR /build
