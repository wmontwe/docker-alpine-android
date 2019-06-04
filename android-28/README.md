# Docker image for Android 28

Source:

- https://github.com/wmontwe/docker-alpine-android

Based on:

- [Alpine Android Base](https://cloud.docker.com/repository/docker/wolfmontwe/docker-alpine-android-base)

## Included

### Android SDK packages

  Path                               | Version | Description                         | Location
  -------                            | ------- | -------                             | -------
  build-tools;28.0.3                 | 28.0.3  | Android SDK Build-Tools 28.0.3      | build-tools/28.0.3/
  extras;android;m2repository        | 47.0.0  | Android Support Repository          | extras/android/m2repository/
  extras;google;google_play_services | 49      | Google Play services                | extras/google/google_play_services/
  extras;google;instantapps          | 1.7.0   | Google Play Instant Development SDK | extras/google/instantapps/
  extras;google;m2repository         | 58      | Google Repository                   | extras/google/m2repository/
  patcher;v4                         | 1       | SDK Patch Applier v4                | patcher/v4/
  platform-tools                     | 28.0.3  | Android SDK Platform-Tools          | platform-tools/
  platforms;android-28               | 6       | Android SDK Platform 28             | platforms/android-28/
  tools                              | 26.1.1  | Android SDK Tools 26.1.1            | tools/

## Usage

### As pull from Docker Hub

```bash
docker pull wolfmontwe/docker-alpine-android:android-28
```

### As local build

```bash
git clone https://github.com/wmontwe/docker-alpine-android.git && cd docker-alpine-android
docker build --no-cache -f android-28/Dockerfile -t docker-alpine-android:android-28 .
docker run --rm -it docker-alpine-android:android-28
```

### As locally running container

```bash
docker run --rm -it wolfmontwe/docker-alpine-android:android-28
```

## Maintenance

### Android

For Android SDK packages have a look at the [SDK manager](https://developer.android.com/studio/command-line/sdkmanager)

List available packages:

```bash
sdkmanager --list
```

Then include the following line in your Dockerfile and add all needed packages:

```dockerfile
RUN sdkmanager <list-of-packages>
```
