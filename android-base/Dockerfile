FROM openjdk:8-jdk-alpine
LABEL maintainer="Wolf Montwe <wolf@wolfmontwe.de>"

# Alpine related
ENV GLIBC_VERSION "2.29-r0"

# Check Linux SDK package: https://developer.android.com/studio/index.html#downloads
ENV ANDROID_SDK_TOOLS_VERSION "4333796"

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

## Add missing files
RUN mkdir -p ~/.android && touch ~/.android/repositories.cfg

## Install Android SDK
RUN ${ANDROID_HOME}/tools/bin/sdkmanager --update \
    && yes | ${ANDROID_HOME}/tools/bin/sdkmanager --licenses \
    && ${ANDROID_HOME}/tools/bin/sdkmanager \
        "tools" \
        "platform-tools" \
        "extras;android;m2repository" \
        "extras;google;m2repository" \
        "extras;google;google_play_services" \
        "extras;google;instantapps"

# Set workdir
WORKDIR /home
