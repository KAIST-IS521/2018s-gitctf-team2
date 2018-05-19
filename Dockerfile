FROM debian:latest

# =========Install your package=========
RUN apt-get update && apt-get install -y make gcc procps
# ======================================

RUN mkdir -p /var/ctf
COPY ./flag /var/ctf/

# ======Build and run your service======
ADD . /src

RUN cd /src; make
#RUN echo '/src/server 4000 &' >> /etc/rc.local

#WORKDIR /src
#RUN ./start.sh
#RUN ps -aux
#RUN /src/server 4000
ENTRYPOINT ["/src/server", "4000"]
#ENTRYPOINT ["nohup","sh","-c","echo", "4000","&"]
#ENTRYPOINT [ "./cclient", "user", "127.0.0.1", "4000" ]
