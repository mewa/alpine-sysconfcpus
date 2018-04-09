FROM alpine:latest as sysconfcpus-build

RUN apk add --no-cache gcc make git musl-dev

RUN git clone https://github.com/obmarg/libsysconfcpus.git
WORKDIR libsysconfcpus

RUN ./configure && make install

FROM alpine:latest as sysconfcpus

COPY --from=sysconfcpus-build /usr/local/bin/sysconfcpus /usr/local/bin/sysconfcpus
RUN apk add --no-cache bash
