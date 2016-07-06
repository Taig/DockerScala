FROM        taig/java:1.0.1

MAINTAINER  Niklas Klein "mail@taig.io"

ENV         SBT 0.13.11
ENV         SCALA 2.11.8

WORKDIR     /root/

RUN         wget \
                https://raw.githubusercontent.com/paulp/sbt-extras/master/sbt \
                -O /bin/sbt
RUN         chmod +x /bin/sbt

RUN         mkdir -p ./cache/project/
RUN         echo "sbt.version=${SBT}" > ./cache/project/build.properties
RUN         echo "scalaVersion := \"${SCALA}\"" > ./cache/build.sbt
RUN         cd ./cache/ && sbt test
RUN         rm -r ./cache/
