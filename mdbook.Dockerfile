FROM rust:1
RUN cargo install mdbook
WORKDIR /data
ENTRYPOINT ["/usr/local/cargo/bin/mdbook"]
CMD ["help"]

