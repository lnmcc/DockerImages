FROM jenkins

ENV ANDROID_SDK=/opt/android-sdk
ENV PATH=$ANDROID_SDK/tools:$PATH
ENV PATH=$ANDROID_SDK/tools/bin:$PATH
ENV PATH=$ANDROID_SDK/platform-tools:$PATH

ENV ANDROID_NDK=/opt/android-ndk-r10e
ENV PATH=$ANDROID_NDK:$PATH

USER root

RUN apt-get update \
    && rm -rf /bin/sh \
    && ln -s /bin/bash /bin/sh \
    && apt-get install -y vim \
    && apt-get install -y build-essential \
    && apt-get install -y yasm \
    && apt-get install -y file \
    && wget https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip -O /opt/android-sdk-tools.zip \
    && unzip /opt/android-sdk-tools.zip -d  /opt \
    && rm -rf /opt/android-sdk-tools.zip \
    && mkdir /opt/android-sdk \
    && mv -v /opt/tools /opt/android-sdk \ 
    && chmod -R 755 /opt/android-sdk \
    && touch /etc/profile.d/android.sh \
    && echo yes | /opt/android-sdk/tools/bin/sdkmanager  "platform-tools" \
    && echo yes | /opt/android-sdk/tools/bin/sdkmanager  "platforms;android-19" \
    && echo yes | /opt/android-sdk/tools/bin/sdkmanager  "build-tools;25.0.3" \
    && wget https://dl.google.com/android/repository/android-ndk-r10e-linux-x86_64.zip -O /opt/android-ndk.zip \
    && unzip /opt/android-ndk.zip -d /opt \
    && chmod -R 755 /opt/android-ndk-r10e \
    && rm -rf /opt/android-ndk.zip

COPY docker-entrypoint.sh /

USER jenkins

#ENTRYPOINT ["/docker-entrypoint.sh"]
