FROM openjdk:8-jdk
LABEL maintainer="Wolf Montwe <wolf@wolfmontwe.de>"

# Check Linux SDK package: https://developer.android.com/studio/index.html#downloads
ENV ANDROID_SDK_TOOLS_VERSION "4333796"

# See also https://developer.android.com/studio/command-line/variables
ENV ANDROID_SDK_ROOT "/opt/android-sdk-linux"
ENV PATH "${PATH}:${ANDROID_SDK_ROOT}/tools:${ANDROID_SDK_ROOT}/tools/bin:${ANDROID_SDK_ROOT}/platform-tools:${ANDROID_SDK_ROOT}/build-tools"

# Install required dependencies
RUN apt-get -qqy update && apt-get -qqy install --no-install-recommends

# Download and extract Android SDK
RUN wget -q http://dl.google.com/android/repository/sdk-tools-linux-${ANDROID_SDK_TOOLS_VERSION}.zip -O /tmp/android-sdk.zip && \
    mkdir -p ${ANDROID_SDK_ROOT} && \
    unzip -qq /tmp/android-sdk.zip -d ${ANDROID_SDK_ROOT} && \
    rm -v /tmp/android-sdk.zip


# Pepare Android SDK

## Add missing files
RUN mkdir -p ~/.android && \
    touch ~/.android/repositories.cfg

## Install Android SDK
RUN sdkmanager --update && \
    yes | sdkmanager --licenses && \
    sdkmanager \
        "tools" \
        "platform-tools" \
        "extras;android;m2repository" \
        "extras;google;m2repository" \
        "extras;google;google_play_services" \
        "extras;google;instantapps"

# Set workdir
WORKDIR /workspace
