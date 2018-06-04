FROM debian:latest

# ======================================
# Install your package here
RUN cd /etc/apt && \
  sed -i 's/deb.debian.org/ftp.daumkakao.com/g' sources.list && \
  sed -i 's/security.debian.org/ftp.daumkakao.com/g' sources.list
RUN apt-get update
RUN apt-get install -y python2.7 python-pip python-dev make 
RUN pip install -i http://ftp.daumkakao.com/pypi/simple pwntools \
  --trusted-host ftp.daumkakao.com
RUN apt-get install -y python-capstone
# ======================================

# ======================================
# Build your exploit here
ADD . /exploit
# ======================================

# ======================================
# Copy your "exploit" to /bin/exploit
ENV PWNLIB_NOTERM 1
COPY exploit.py /bin/exploit
RUN chmod +x /bin/exploit
RUN cp /exploit/server /
# ======================================
