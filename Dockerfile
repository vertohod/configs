# Наследуемся от Ubuntu                                                                                                                                                                                                                       
FROM ubuntu                                                                                                                                                                                                                                   
WORKDIR /root                                                                                                                                                                                                                                 

USER root

# Установка необходимого ПО
RUN apt-get update
RUN apt-get install curl -y
RUN apt-get install screen -y
RUN apt-get install vim -y
RUN apt-get install g++ -y
RUN apt-get install libboost-all-dev -y
RUN apt-get install cmake -y
RUN apt-get install git -y
RUN apt-get clean
RUN apt-get purge

# Настрофка среды
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
