# rust-musl-cross-docker

A Docker image with necessary dependencies to build static cross-compiled binaries for musl from Rust

## How to use

In your project, create a `.cargo/config.toml` file with this content:

```toml
[target.x86_64-unknown-linux-musl]
linker = "x86_64-linux-gnu-gcc"
rustflags = ["-Clink-self-contained=yes"]

[target.aarch64-unknown-linux-musl]
linker = "aarch64-linux-gnu-gcc"
rustflags = ["-Clink-self-contained=yes"]
```

Then, you can build the project with `docker run --rm -it -v .:/build -v $HOME/.cargo/registry:/usr/local/cargo/registry ghcr.io/esposm03/rust-musl-cross-docker <build command>`,
where the build command is usually something like `cargo build --release --target x86_64-unknown-linux-gnu`.