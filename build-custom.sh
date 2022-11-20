#!/usr/bin/env bash

multiarch_build () {
    IMAGE_NAME=$1;
    IMAGE_TAG=$2;

    docker buildx build --platform "linux/amd64,linux/arm64" -t "us-docker.pkg.dev/structionsite/debezium/$IMAGE_NAME:$IMAGE_TAG" "$IMAGE_NAME/$IMAGE_TAG" --push
}

# multiarch_build "postgres" "12-alpine"
multiarch_build "base" "latest"
multiarch_build "zookeeper" "1.9"
multiarch_build "kafka" "1.9"
multiarch_build "connect-base" "1.9"
multiarch_build "connect" "1.9"
