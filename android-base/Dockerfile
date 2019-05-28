#
# Docker image for Android based on Alpine Linux with OpenJDK JRE
#
# https://hub.docker.com/r/wolfmontwe/docker-alpine-android/
#
FROM openjdk:8-jre-alpine
LABEL maintainer="Wolf Montwe <wolf@wolfmontwe.de>"

# Alpine related
ENV GLIBC_VERSION "2.29-r0"

# Check Linux SDK package: https://developer.android.com/studio/index.html#downloads
ENV ANDROID_SDK_TOOLS_VERSION "4333796"
ENV ANDROID_LICENSE = "24333f8a63b6825ea9c5514f83c2829b004d1fee"
ENV ANDROID_PREVIEW_LICENSE = "4831b9409646a918e30573bab4c9c91346d8abd\n504667f4c0de7af1a06de9f4b1727b84351f2910\n"

ENV ANDROID_HOME "/opt/android-sdk-linux"
ENV PATH "${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/build-tools"


# Install required dependencies for Alpine
RUN apk add --no-cache bash git unzip wget && \
    wget -q https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub -O /etc/apk/keys/sgerrand.rsa.pub && \
    wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk -O /tmp/glibc.apk && \
    wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk -O /tmp/glibc-bin.apk && \
    apk add --no-cache /tmp/glibc.apk /tmp/glibc-bin.apk && \
    apk add --virtual .rundeps $runDeps && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/*

# Download and extract Android SDK
RUN wget -q http://dl.google.com/android/repository/sdk-tools-linux-${ANDROID_SDK_TOOLS_VERSION}.zip -O /tmp/android-sdk.zip && \
    mkdir -p ${ANDROID_HOME} && \
    unzip -qq /tmp/android-sdk.zip -d ${ANDROID_HOME} && \
    rm -v /tmp/android-sdk.zip


# Pepare Android SDK
## Accept Licenses
RUN mkdir -p ${ANDROID_HOME}/licenses \
  && echo -e "24333f8a63b6825ea9c5514f83c2829b004d1fee" > ${ANDROID_HOME}/licenses/android-sdk-license \
  && echo -e "84831b9409646a918e30573bab4c9c91346d8abd\n504667f4c0de7af1a06de9f4b1727b84351f2910\n" > ${ANDROID_HOME}/licenses/android-sdk-preview-license

## Add missing files
RUN mkdir -p ~/.android && touch ~/.android/repositories.cfg

## Install Android SDK
RUN ${ANDROID_HOME}/tools/bin/sdkmanager --update \
    && ${ANDROID_HOME}/tools/bin/sdkmanager \
        "platform-tools" \
        "extras;android;m2repository" \
        "extras;google;m2repository" \
        "extras;google;google_play_services" \
        "extras;google;instantapps"


WORKDIR /home/android
