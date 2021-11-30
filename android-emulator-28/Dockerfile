FROM wolfmontwe/docker-alpine-android:android-emu-base
LABEL maintainer="Wolf Montwe <wolf@wolfmontwe.de>"

ENV EMULATOR_API "28"
#ENV EMULATOR_TYPE "default"
ENV EMULATOR_TYPE "google_apis_playstore"
#ENV EMULATOR_ABI "armeabi-v7a"
ENV EMULATOR_ABI "x86"


# Install dependencies for emulation
RUN apt-get -qqy update && apt-get -qqy install --no-install-recommends \
      libgl1-mesa-dev


# Install SDK Emulator Packages
RUN sdkmanager "system-images;android-${EMULATOR_API};${EMULATOR_TYPE};${EMULATOR_ABI}"

# Create AVD ... use yes to say no ;-)
RUN echo "no" | avdmanager create avd \
      -n test \
      -k "system-images;android-${EMULATOR_API};${EMULATOR_TYPE};${EMULATOR_ABI}" \
      -c 1000M \
      -f

# Start emulator
#RUN emulator-headless  \
#      -avd test \
#      -gpu swiftshader_indirect \
#      -no-snapshot \
#      -no-accel \
#      -no-audio \
#      -no-boot-anim &
#      -wipe-data \
#      -partition-size 1024

