FROM opensuse:tumbleweed

RUN zypper --gpg-auto-import-keys -n update
RUN zypper -n install \
    clang             \
    gcc gcc-c++       \
    libX11-devel      \
    libXext-devel     \
    make              \
    which             \
    tar               \
    ksh               \
    tcsh              \
    zsh               \
    ltrace            \
    nasm                       \
    cunit-devel                \
    libSDL-devel libSDL2-devel \
    ncurses ncurses-devel      \
    gmp-devel                  \
    terminfo                   \
    boost-devel                \
    php5                       \
    php5-bcmath                \
    php5-mbstring              \
    python-numpy               \
    python3                    \
    python3-pip                \
    ca-certificates-mozilla    \
    python3-numpy              \
    ruby                       \
    ocaml                      \
    ocaml-camlp4               \
    bc                         \
    tmux                       \
    valgrind gdb               \
    zip unzip                  \
    glibc-locale

RUN pip3 install -Iv pexpect==4.0.1

ADD .bashrc /etc/skel/.bashrc
ENTRYPOINT /bin/bash
