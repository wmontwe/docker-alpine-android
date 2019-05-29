# Docker image for Android based on Alpine Linux with OpenJDK 8

Source: 
- https://github.com/wmontwe/docker-alpine-android

Based on:
- [Alpine 3.9](https://hub.docker.com/_/alpine)
- [OpenJDK 8](https://hub.docker.com/_/openjdk)

## Included

### Android SDK packages

  Path                               | Version | Description                         | Location
  -------                            | ------- | -------                             | -------
  extras;android;m2repository        | 47.0.0  | Android Support Repository          | extras/android/m2repository/
  extras;google;google_play_services | 49      | Google Play services                | extras/google/google_play_services/
  extras;google;instantapps          | 1.7.0   | Google Play Instant Development SDK | extras/google/instantapps/
  extras;google;m2repository         | 58      | Google Repository                   | extras/google/m2repository/
  patcher;v4                         | 1       | SDK Patch Applier v4                | patcher/v4/
  platform-tools                     | 28.0.3  | Android SDK Platform-Tools          | platform-tools/
  tools                              | 26.1.1  | Android SDK Tools 26.1.1            | tools/

## Usage

### As base image

In your Dockerfile use

```dockerfile
FROM wolfmontwe/docker-alpine-android-base
```

### As pull from Docker Hub

```bash
docker pull wolfmontwe/docker-alpine-android-base
```

### As local build

```bash
git clone https://github.com/wmontwe/docker-alpine-android.git && cd docker-alpine-android
docker build --no-cache -f android-base/Dockerfile -t docker-alpine-android-base .
```

### As locally running container

```bash
docker run --rm -it wolfmontwe/docker-alpine-android-base
```

## Maintenance

### Alpine

If you want to install an Alpine package, please have a look at the available [packages](https://pkgs.alpinelinux.org/packages?branch=v3.9)

Then just include the following line in your Dockerfile and add all needed packages:

```dockerfile
RUN apk add --no-cache <list-of-packages>
```

### Android

For Android SDK packages have a look at the [SDK manager](https://developer.android.com/studio/command-line/sdkmanager)

List available packages:

```bash
sdkmanager --list
```

Then include the following line in your Dockerfile and add all needed packages:

```dockerfile
RUN ${ANDROID_HOME}/tools/bin/sdkmanager <list-of-packages>
```
