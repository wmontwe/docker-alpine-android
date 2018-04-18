# gitlab-ci-android
GitLab CI docker image for building Android Apps

This image is based on [openjdk:8-jdk]()


Example `.gitlab-ci.yml`
```yml
image: wmontwe/gitlab-ci-android

stages:
  - build
  - test

build:
  stage: build
  script:
    - ./gradlew assembleDebug
  artifacts:
    paths:
      - app/build/outputs/

unitTests:
  stage: test
  script:
    - ./gradlew test
```
