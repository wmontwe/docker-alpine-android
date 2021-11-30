FROM wolfmontwe/docker-alpine-android:android-28
LABEL maintainer="Wolf Montwe <wolf@wolfmontwe.de>"

# Install dependencies for emulation
RUN apt-get -qqy update && apt-get -qqy install --no-install-recommends
      libgl1-mesa-dev

# Important: move emulator at the start to replace the old emulator located under ${ANDROID_SDK_ROOT}/tools
ENV PATH "${ANDROID_SDK_ROOT}/emulator:${PATH}"

# Install SDK Emulator Packages
RUN sdkmanager \
       "emulator" && \
    yes | sdkmanager --licenses
