FROM debian:stretch-slim

LABEL authors https://www.oda-alexandre.com/

ENV USER vscode
ENV VERSION 1.40
ENV LOCALES fr_FR.UTF-8

RUN echo -e '\033[36;1m ******* INSTALL PACKAGES ******** \033[0m'; \
  apt update && apt install -y --no-install-recommends \
  locales \
  sudo \
  ca-certificates \
  apt-transport-https \
  software-properties-common \
  gnupg \
  curl

RUN echo -e '\033[36;1m ******* CHANGE LOCALES ******** \033[0m'; \
  locale-gen ${LOCALES}
  
RUN echo -e '\033[36;1m ******* ADD USER ******** \033[0m'; \
  useradd -d /home/${USER} -m ${USER}; \
  passwd -d ${USER}; \
  adduser ${USER} sudo

RUN echo -e '\033[36;1m ******* SELECT USER ******** \033[0m'
USER ${USER}

RUN echo -e '\033[36;1m ******* SELECT WORKING SPACE ******** \033[0m'
WORKDIR /home/${USER}

RUN echo -e '\033[36;1m ******* ADD REPOSITORY ******** \033[0m'; \
  curl -sSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo apt-key add -; \
  echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee -a /etc/apt/sources.list.d/vscode.list

RUN echo -e '\033[36;1m ******* INSTALL APP ******** \033[0m'; \
  sudo apt update && sudo apt install -y --no-install-recommends \
  code \
  git \
  python3 \
  python3-setuptools \
  libasound2 \
  libatk1.0-0 \
  libcairo2 \
  libcups2 \
  libexpat1 \
  libfontconfig1 \
  libfreetype6 \
  libgtk2.0-0 \
  libpango-1.0-0 \
  libx11-xcb1 \
  libxcomposite1 \
  libxcursor1 \
  libxdamage1 \
  libxext6 \
  libxfixes3 \
  libxi6 \
  libxrandr2 \
  libxrender1 \
  libxss1 \
  libxtst6 \
  openssh-client

RUN echo -e '\033[36;1m ******* INSTALL PIP ******** \033[0m'; \
  sudo easy_install3 pip

RUN echo -e '\033[36;1m ******* INSTALL POWERSHELL ******** \033[0m'; \
  curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -; \
  sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/microsoft.list'; \
  sudo apt update && sudo apt install -y powershell

RUN echo -e '\033[36;1m ******* CLEANING ******** \033[0m'; \
  sudo apt-get --purge autoremove -y \
  curl

RUN echo -e '\033[36;1m ******* CONTAINER START COMMAND ******** \033[0m'
ENTRYPOINT /usr/share/code/code \