FROM debian:bookworm-slim AS build

# Install Dependencies.
RUN apt-get update -y && \
    apt-get install -y \
        git \
        wget \
        curl \
        unzip \
        lib32stdc++6 \
        libglu1-mesa && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV FLUTTER_ROOT="/opt/flutter"
ENV PATH="${FLUTTER_ROOT}/bin:${PATH}"

# Set a default channel (branch)
ARG channel=beta

# Install Flutter.
RUN git clone -b $channel https://github.com/flutter/flutter "${FLUTTER_ROOT}"

# Disable analytics and crash reporting on the builder.
RUN flutter config --disable-analytics

# Perform a doctor run.
RUN flutter doctor -v

# Perform an artifact precache so that no extra assets need to be downloaded on demand.
RUN flutter precache --web

# Builds dartpad services.
FROM build AS dartpad-services

WORKDIR /
COPY . .

WORKDIR /pkgs/dart_services

RUN dart pub get
RUN dart compile exe bin/server.dart -o bin/server

RUN dart run grinder build-project-templates

EXPOSE 8080
CMD ["/pkgs/dart_services/bin/server"]
