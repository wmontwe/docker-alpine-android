FROM wolfmontwe/docker-alpine-android:android-28
LABEL maintainer="Wolf Montwe <wolf@wolfmontwe.de>"

# Install SDK Emulator Packages
RUN sdkmanager \
       "emulator" && \
    yes | sdkmanager --licenses
