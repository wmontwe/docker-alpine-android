FROM wolfmontwe/docker-alpine-android:android-28
LABEL maintainer="Wolf Montwe <wolf@wolfmontwe.de>"

# Google Cloud SDK
ENV GOOGLE_CLOUD_SDK_VERSION "248.0.0"

ENV GOOGLE_CLOUD_HOME "/opt/google-cloud-sdk"

ENV PATH "${PATH}:${GOOGLE_CLOUD_HOME}/bin"

# Install required dependencies for Google Cloud SDK
RUN apt-get -qqy update && apt-get -qqy install --no-install-recommends \
      python

# Download and extract Google cloud services SDK
# https://cloud.google.com/sdk/docs/downloads-versioned-archives
RUN wget -q https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GOOGLE_CLOUD_SDK_VERSION}-linux-x86_64.tar.gz -O /tmp/gc-sdk.tar.gz && \
    tar xzf /tmp/gc-sdk.tar.gz && \
    rm -v /tmp/gc-sdk.tar.gz && \
    mv google-cloud-sdk/ /opt/

# Setup Google Cloud SDK
RUN gcloud config set core/disable_usage_reporting true && \
    gcloud config set component_manager/disable_update_check true && \
    gcloud --quiet components update && \
    gcloud --quiet version
