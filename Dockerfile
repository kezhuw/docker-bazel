FROM ubuntu:15.10

MAINTAINER Kezhu Wang kezhuw@gmail.com

RUN apt-get update && \
    apt-get install -y wget && \
    wget https://github.com/bazelbuild/bazel/releases/download/0.1.3/bazel_0.1.3-linux-x86_64.deb && \
    echo "459207985a53bbaf3eace24c8bbba2cd37cbce04086086d7a60894c3a62b6d44  bazel_0.1.3-linux-x86_64.deb" | sha256sum --status --check - && \
    dpkg --install bazel_0.1.3-linux-x86_64.deb ; \
    rm bazel_0.1.3-linux-x86_64.deb && \
    apt-get install --fix-broken -y && \
    apt-get remove --auto-remove --purge -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
