FROM    nvcr.io/nvidia/tensorflow:24.01-tf2-py3
RUN     apt-get update && apt-get install -y  clang openjdk-17-jdk-headless
WORKDIR /workspace
RUN     wget https://dl.google.com/android/repository/android-ndk-r21e-linux-x86_64.zip -O android-ndk-r21e-linux-x86_64.zip
RUN     unzip android-ndk-r21e-linux-x86_64.zip
ENV     ANDROID_NDK_HOME=/workspace/android-ndk-r21e/
RUN     rm android-ndk-r21e-linux-x86_64.zip
RUN     wget https://dl.google.com/android/repository/commandlinetools-linux-13114758_latest.zip?hl=zh-cn -O commandlinetools-linux-13114758_latest.zip
RUN     unzip commandlinetools-linux-13114758_latest.zip
RUN     rm commandlinetools-linux-13114758_latest.zip
RUN     mkdir -p /root/Android/Sdk/cmdline-tools/
RUN     mv cmdline-tools /root/Android/Sdk/cmdline-tools/latest
ENV     ANDROID_SDK_ROOT=/root/Android/Sdk
ENV     ANDROID_HOME=/root/Android/Sdk
ENV     PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools
ENV     yes | sdkmanager --licenses
RUN     sdkmanager "platform-tools" "platforms;android-33" "build-tools;33.0.3" 