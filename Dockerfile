FROM ubuntu:20.04 AS base

WORKDIR /unmined

RUN apt-get update && apt-get install -y wget tar unzip

RUN wget -c https://unmined.net/download/unmined-cli-linux-x64-dev/?tmstv=1717833739 -O unmined.tar.gz && \
    tar -xvf unmined.tar.gz --strip-components=1 && \
    rm unmined.tar.gz

ENV PATH="${PATH}:/unmined"
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1

WORKDIR /app

COPY entrypoint.sh ./

CMD ["./entrypoint.sh"]
