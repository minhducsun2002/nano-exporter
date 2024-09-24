FROM debian:bookworm as build
RUN apt update
RUN apt install -y make gcc
WORKDIR /app
COPY . .
RUN make

FROM busybox:glibc
WORKDIR /app
COPY --from=build /app/nano-exporter nano-exporter
ENTRYPOINT /app/nano-exporter