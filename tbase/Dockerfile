FROM ubuntu:22.04

RUN yes | unminimize

COPY ./pkgs .

RUN apt-get -qq update && apt-get -qqy install $(cat ./pkgs) && rm pkgs

RUN useradd -m -s /bin/bash -G sudo null && usermod -p $(openssl passwd null) null

RUN echo 'null ALL=(ALL) NOPASSWD: ALL' | tee /etc/sudoers

USER null

WORKDIR /home/null

# Install neovim
RUN git clone https://github.com/neovim/neovim && \
  cd neovim && git checkout stable && \
  make CMAKE_BUILD_TYPE=RelWithDebInfo 2>&1 | tee make.log && \
  cd build && \
  cpack -G DEB 2>&1 | tee cpack.log && \
  sudo dpkg -i nvim-linux64.deb

RUN rm -fr neovim
