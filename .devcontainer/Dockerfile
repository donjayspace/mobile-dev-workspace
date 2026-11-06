# Base image supplies a non-root development user and common Linux tooling.
FROM mcr.microsoft.com/devcontainers/base:bookworm

# Install utilities commonly needed by JavaScript, Python, and database tooling.
# Keep this list intentionally small so Codespace creation remains reasonably fast.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       ca-certificates \
       curl \
       git \
       jq \
       openssh-client \
       postgresql-client \
       unzip \
       zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
