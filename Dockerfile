FROM debian:latest

# =========Install your package=========
RUN apt-get update && apt-get install -y make gcc procps
# ======================================

# ======================================
# Build your exploit here
# ======================================


# ======Build and run your exploit=====
COPY exploit.py /bin/exploit
# ======================================
