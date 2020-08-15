FROM ubuntu

ARG USER_ID
ARG GROUP_ID

RUN apt-get update -y && apt-get upgrade -y && apt-get install python3 python3-pip -y
RUN ln -s /usr/bin/python3 /usr/bin/python & \
    ln -s /usr/bin/pip3 /usr/bin/pip
RUN addgroup --gid $GROUP_ID user
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user
RUN echo "user  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/user
USER user


