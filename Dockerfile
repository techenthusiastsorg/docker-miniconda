FROM ubuntu as ubuntu-base

RUN apt-get update -y && apt-get upgrade -y && apt-get install sudo wget python3 python3-pip -y
RUN ln -s /usr/bin/python3 /usr/bin/python & \
    ln -s /usr/bin/pip3 /usr/bin/pip

FROM ubuntu-base as miniconda-base

ARG GROUP_ID=1000
ARG USER_ID=1000
ARG USER_NAME=user

RUN addgroup --gid $GROUP_ID $USER_NAME
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID $USER_NAME
RUN echo "user  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$USER_NAME
USER $USER_NAME

WORKDIR /home/$USER_NAME

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh

RUN bash miniconda.sh -b -p $HOME/miniconda && rm miniconda.sh

RUN bash -c "set -e; source miniconda/bin/activate; conda update -y -n base -c defaults conda"

