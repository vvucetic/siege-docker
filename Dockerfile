FROM ubuntu

MAINTAINER Vedran Vucetic <vedran.vucetic@gmail.com>
LABEL maintainer "vedran.vucetic@gmail.com"

RUN apt-get update -y && apt-get upgrade -y --show-upgraded &&\
    apt-get install -y build-essential &&\
    apt-get install -y libssl-dev &&\
    apt-get install -y wget &&\
    apt-get install -y xz-utils

RUN wget http://download.joedog.org/siege/siege-latest.tar.gz &&\
    tar -zxvf siege-latest.tar.gz
    
RUN cd siege-* && ./configure --prefix=/usr/local --with-ssl=/usr/bin/openssl &&\
    make &&\
    make install

ENTRYPOINT ["siege"]
CMD ["--help"]