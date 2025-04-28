FROM debian:bookworm-slim AS base
ENV FLUTTER_ROOT="/opt/flutter"
ENV PATH="${FLUTTER_ROOT}/bin:${PATH}"
ARG FLUTTER_CHANNEL=beta

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

RUN git clone -b $FLUTTER_CHANNEL https://github.com/flutter/flutter "${FLUTTER_ROOT}"
RUN flutter config --disable-analytics
RUN flutter doctor -v
RUN flutter precache --web

# Builds the artifacts needed for the dartpad services.
FROM base AS build-dependencies
COPY . .
WORKDIR /pkgs/dart_services

RUN dart pub get

# Builds the artifacts
FROM build-dependencies AS build-artifacts
WORKDIR /pkgs/dart_services

RUN dart run grinder build-storage-artifacts
RUN echo $(cat /opt/flutter/bin/cache/dart-sdk/version) > dart_version.txt

# Uploads the artifacts
FROM gcr.io/google.com/cloudsdktool/cloud-sdk AS upload-artifacts
ARG GCLOUD_AUTH
ENV GCLOUD_AUTH="${GCLOUD_AUTH}"

COPY --from=build-artifacts /pkgs/dart_services/artifacts /artifacts
COPY --from=build-artifacts /pkgs/dart_services/dart_version.txt /dart_version.txt

RUN echo $GCLOUD_AUTH | base64 --decode > credentials.json
RUN gcloud auth activate-service-account polkadart@polkadart.iam.gserviceaccount.com --key-file=credentials.json
RUN gcloud config set project polkadart
RUN gsutil -h "Cache-Control: public, max-age=604800, immutable" cp -z js artifacts/*.js* gs://polkadart/$(cat dart_version.txt)/

# Builds dartpad services.
FROM build-dependencies AS dartpad-services
WORKDIR /pkgs/dart_services

RUN dart pub get
RUN dart compile exe bin/server.dart -o bin/server
RUN dart run grinder build-project-templates

EXPOSE 8080
CMD ["/pkgs/dart_services/bin/server", "--redis-url", "redis://host.docker.internal:6379", "--storage-bucket", "polkadart"]
