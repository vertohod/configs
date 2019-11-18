# Наследуемся от Ubuntu
FROM ubuntu

WORKDIR /root
USER root

# Установка необходимого ПО
RUN apt-get update && apt-get install -y \
  curl \
  screen \
  vim \
  g++ \
  libboost-all-dev \
  cmake \
  git \
  && apt-get clean && apt-get purge

# Настройка среды
RUN git -C /root clone https://github.com/vertohod/configs.git
RUN cp /root/configs/vimrc /root/.vimrc
RUN cp /root/configs/screenrc /etc/screenrc
RUN rm -rf /root/configs
RUN curl -fLo /root/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Настройки git
RUN git config --global user.email "vertohod1@mail.ru"
RUN git config --global user.name "Sergey Potapov"

# Скачиваем исходники
RUN git -C /root clone https://github.com/vertohod/project_swarm.git
RUN git -C /root/project_swarm submodule init
RUN git -C /root/project_swarm submodule update --recursive
