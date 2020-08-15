# Build

## Build the base

```bash
docker build -t playground --build-arg USER_ID=$(id -u)   --build-arg GROUP_ID=$(id -g) --target base .
```

## Build the playground

```bash
docker build -t playground --build-arg USER_ID=$(id -u)   --build-arg GROUP_ID=$(id -g) --target playground .
```

## Run

```bash
docker run -it --name playground -p 8888:8888 -v $(pwd):/home/user/notebooks --workdir /home/user playground:latest /bin/bash 
```

Inside the container now:

```bash
user@4dd247b0f5e3:~$ source miniconda/bin/activate
(base) user@4dd247b0f5e3:~$ conda install jupyter -y
(base) user@4dd247b0f5e3:~$ jupyter notebook --notebook-dir=/home/user/notebooks --ip='*' --port=8888 --no-browser 
```
or
```bash
jupyter lab --notebook-dir=/home/user/notebooks --ip='*' --port=8888 --no-browser
```
for [jupyterlab](https://jupyterlab.readthedocs.io/en/latest/getting_started/starting.html) experience


now the files in your host directory are of your host user.
