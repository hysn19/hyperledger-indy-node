FROM ubuntu:16.04
MAINTAINER jckim@raoncorp.com

# ubuntu setup
RUN sed -i 's/archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
RUN sed -i 's/security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
RUN sed -i 's/extras.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
RUN rm -rfv /var/lib/apt/lists/* && sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list

RUN apt update && apt -y install vim && apt -y install git
RUN apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libsqlite3-dev
RUN apt-get update && apt install -y python-pip && apt install -y python3-pip

# 0. dev setup
## get scripts from dev-setup-ubuntu
WORKDIR /home/hyperledger/
RUN git init
RUN git config core.sparseCheckout true
RUN git remote add -f origin https://github.com/hyperledger/indy-node
RUN echo "dev-setup" >> .git/info/sparse-checkout
RUN git pull origin master

## quick setup on ubuntu 16.04
RUN cd dev-setup/ubuntu
RUN echo "/bin/sh -c ./setup-dev-python.sh"
RUN echo "/bin/sh -c source ~/.bashrc"
RUN echo "/bin/sh -c ./setup-dev-depend-ubuntu16.sh"
RUN echo "/bin/sh -c ./init-dev-project.sh hysn19 hyperledger-dev-node"
RUN echo "/bin/sh -c workon hyperledger-dev-node"

## setup indy-crypto
RUN apt-get update
RUN apt-get install apt-transport-https 
RUN apt-get install ca-certificates
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE7709D068DB5E88
RUN echo "/bin/sh -c add-apt-repository 'deb https://repo.sovrin.org/deb xenial master'"
RUN apt-get update
RUN echo "/bin/sh -c apt-get install -y libindy-crypto"

## setup rocksdb
## end of repository configuration steps
RUN echo "/bin/sh -c apt-get install libbz2-dev \
    zlib1g-dev \
    liblz4-dev \
    libsnappy-dev \
    rocksdb=5.8.8"

## setup libindy
RUN echo "/bin/sh -c add-apt-repository 'deb https://repo.sovrin.org/sdk/deb xenial stable'"
RUN apt-get update
RUN echo "/bin/sh -c apt-get install -y libindy"

## using a virtual environment (recommended)
RUN echo "/bin/sh -c virtualenv -p python3.5 hyperledger-dev-node"
RUN echo "/bin/sh -c source hyperledger-dev-node/bin/activate"

RUN pip3 install virtualenvwrapper
RUN echo '' >> ~/.bashrc
RUN echo '# Python virtual environment wrapper' >> ~/.bashrc
RUN echo 'export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3' >> ~/.bashrc
RUN echo 'export WORKON_HOME=$HOME/.virtualenvs' >> ~/.bashrc
RUN echo 'source /usr/local/bin/virtualenvwrapper.sh' >> ~/.bashrc
RUN echo "/bin/sh -c source ~/.bashrc"

RUN echo "/bin/sh -c mkvirtualenv -p python3.5 hyperledger-dev-node"
RUN echo "/bin/sh -c workon hyperledger-dev-node"

## installing code and running tests
RUN pip install --upgrade pip
RUN cd /home/hyperledger/dev-setup/ubuntu/indy-node
RUN pip install -e .[tests]

RUN cd /home/hyperledger/dev-setup/ubuntu/indy-plenum
RUN pip install -e .[tests]

# 1. install indy node
## install
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE7709D068DB5E88
RUN bash -c 'echo "deb https://repo.sovrin.org/deb xenial stable" >> /etc/apt/sources.list'
RUN apt-get update && apt-get install indy-node

## initialize Node to be included into the Network
RUN cd /home/hyperledger/dev-setup/ubuntu/indy-node/scripts/ && ./create_dirs.sh
RUN cd /etc/indy && vim indy_config.py
RUN mkdir /var/lib/indy/sandbox
RUN cd sandbox
RUN touch pool_transactions_genesis
RUN touch domain_transactions_genesis

## local test network example
RUN generate_indy_pool_transactions --nodes 4 --clients 5 --nodeNum 1 2 3 4

RUN start_indy_node Node1 0.0.0.0 9701 0.0.0.0 9702
RUN start_indy_node Node2 0.0.0.0 9703 0.0.0.0 9704
RUN start_indy_node Node3 0.0.0.0 9705 0.0.0.0 9706
RUN start_indy_node Node4 0.0.0.0 9707 0.0.0.0 9708

EXPOSE 9701 9702 9703 9704 9705 9706 9707 9708