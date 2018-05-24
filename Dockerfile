FROM debian:latest

# =========Install your package=========
RUN cd /etc/apt && \
  sed -i 's/deb.debian.org/ftp.daumkakao.com/g' sources.list && \
  sed -i 's/security.debian.org/ftp.daumkakao.com/g' sources.list
RUN apt-get update && apt-get install -y make gcc procps
RUN apt-get install -y gdb
# ======================================

RUN mkdir -p /var/ctf
COPY ./flag /var/ctf/

# ======Build and run your service======
ADD . /src

RUN cd /src; make clean; make
RUN echo '/tmp/core.%h.%e.%t' > /proc/sys/kernel/core_pattern
RUN ulimit -c unlimited

ENTRYPOINT ["/src/server", "4000"]
