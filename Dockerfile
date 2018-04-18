#
# GitLab CI: Android v0.1
#
# https://hub.docker.com/r/wmontwe/gitlab-ci-android/
#

FROM openjdk:8-jdk
MAINTAINER Wolf Montwe <wolf@wolfmontwe.de>

# Check Linux SDK package: https://developer.android.com/studio/index.html#downloads
ENV ANDROID_SDK_TOOLS_VERSION "3859397"

ENV ANDROID_PLATFORM_VERSION 27

ENV ANDROID_HOME "/opt/android-sdk-linux"
ENV PATH "$PATH:${ANDROID_HOME}/tools:$PATH:${ANDROID_HOME}/tools/bin:$PATH:${ANDROID_HOME}/platform-tools:$PATH:${ANDROID_HOME}/build-tools"
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
  && apt-get install --yes --no-install-recommends \
    curl \
    lib32stdc++6 \
    lib32z1 \
    unzip \
	&& rm -rf /var/lib/apt/lists/*

RUN curl -s https://dl.google.com/android/repository/sdk-tools-linux-${ANDROID_SDK_TOOLS_VERSION}.zip > android-sdk.zip \
  && unzip /android-sdk.zip -d /opt/android-sdk-linux \
  && rm -v /android-sdk.zip

RUN mkdir -p $ANDROID_HOME/licenses \
  && echo -e "8933bad161af4178b1185d1a37fbf41ea5269c55\nd56f5187479451eabf01fb78af6dfcb131a6481e" > $ANDROID_HOME/licenses/android-sdk-license \
  && echo -e "84831b9409646a918e30573bab4c9c91346d8abd\n504667f4c0de7af1a06de9f4b1727b84351f2910" > $ANDROID_HOME/licenses/android-sdk-preview-license

RUN mkdir -p ~/.android \
  && touch ~/.android/repositories.cfg

RUN sdkmanager --update \
  && sdkmanager --channel=0 "tools" "platform-tools" "platforms;android-${ANDROID_PLATFORM_VERSION}"
