FROM wolfmontwe/docker-alpine-android-base
LABEL maintainer="Wolf Montwe <wolf@wolfmontwe.de>"

ENV BUILD_TOOLS "28.0.3"
ENV TARGET_SDK "28"

# Install SDK Packages
RUN sdkmanager \
     "build-tools;${BUILD_TOOLS}" \
     "platforms;android-${TARGET_SDK}"
