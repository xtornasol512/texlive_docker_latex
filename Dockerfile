# Stage 1: Install Texlive
FROM python:3.9.16-buster AS texlive

# Set work directory
WORKDIR /app

# Install Texlive dependencies
RUN apt-get update && apt-get install -y wget xz-utils perl-modules make perl-doc && \
    cpan install Pod::Usage

# Copy custom Texlive profile
COPY texlive_docker.profile /app/texlive.profile

# Download and install Texlive
RUN <<EOF
    set -e
    mkdir -p /app/build/.texlive; \
    wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
    tar -xzf install-tl-unx.tar.gz && \
    cd install-tl-* && \
    ./install-tl --profile=/app/texlive.profile > /app/installation.log && \
    cd .. && \
    rm -rf install-tl-* install-tl-unx.tar.gz
EOF

# Stage 2: Final Image
FROM texlive as final

# Copy Texlive installation from the previous stage
COPY --from=texlive /app/build /app/build

# Set environment variables
ENV PATH="/app/build/.texlive/bin/aarch64-linux:${PATH}"

RUN echo $ARCH_DIR

COPY ./texlive.packages /app/

RUN echo $PATH

RUN env PATH="$PATH" tlmgr install $(cat /app/texlive.packages)

# Set work directory
WORKDIR /app

CMD ["sh"]
