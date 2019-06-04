# Docker image for Google Cloud SDK

Source:

- https://github.com/wmontwe/docker-alpine-android

Based on:

- [Alpine Android 28](https://cloud.docker.com/repository/docker/wolfmontwe/docker-alpine-android)

## Included

### Google Cloud SDK

Current version: 248.0.0

## Usage

### As base image

In your Dockerfile use

```dockerfile
FROM wolfmontwe/docker-alpine-android:android-gc
```

### As pull from Docker Hub

```bash
docker pull wolfmontwe/docker-alpine-android:android-gc
```

### As local build

```bash
git clone https://github.com/wmontwe/docker-alpine-android.git && cd docker-alpine-android
docker build --no-cache -f android-google-cloud/Dockerfile -t docker-alpine-android:android-gc .
docker run --rm -it docker-alpine-android:android-gc
```

### As locally running container

```bash
docker run --rm -it wolfmontwe/docker-alpine-android:android-gc
```

## Maintenance

### Google Cloud SDK

Have a look at the [quickstart Linux guide](https://cloud.google.com/sdk/docs/quickstart-linux)
