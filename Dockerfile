FROM ubuntu:focal
ARG BRANCH
WORKDIR /app
ENV DEBIAN_FRONTEND noninteractive
ENV TZ=UTC
RUN apt-get update && apt-get install -qqy wget git curl lsb-core
RUN wget https://raw.githubusercontent.com/percona/percona-server/${BRANCH}/build-ps/percona-server-5.7_builder.sh -O percona-server_builder.sh
RUN sed -i 's:sudo::g' percona-server_builder.sh
RUN mkdir /tmp/BUILD_PS
RUN bash ./percona-server_builder.sh --builddir=/tmp/BUILD_PS --install_deps=1
RUN bash ./percona-server_builder.sh --builddir=/tmp/BUILD_PS --get_sources=1 --repo=https://github.com/percona/percona-server.git --branch=${BRANCH}
RUN bash ./percona-server_builder.sh --builddir=/tmp/BUILD_PS --build_source_deb=1
RUN bash ./percona-server_builder.sh --builddir=/tmp/BUILD_PS --build_deb=1
