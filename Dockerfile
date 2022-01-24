### phase 1
FROM openjdk:8-jdk

ARG MVND_VERSION=0.7.1
ARG DOWNLOAD_URL=https://github.com/apache/maven-mvnd/releases/download/${MVND_VERSION}/mvnd-${MVND_VERSION}-linux-amd64.zip

RUN mkdir -p /tmp/mvnd \
  && curl -fsSL -o mvnd.zip ${DOWNLOAD_URL} \
  && unzip  mvnd.zip -d /tmp/mvnd

### phase 2
FROM openjdk:8-jdk
COPY --from=0  /tmp/mvnd /usr/local/

ENV MVND_VERSION=0.7.1
ENV MVND_HOME=/usr/local/mvnd-${MVND_VERSION}-linux-amd64
ENV PATH=.:$MVND_HOME/bin:$PATH

CMD ["mvnd"]
