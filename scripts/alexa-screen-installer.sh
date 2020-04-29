#!/bin/bash

set -o errexit

scripts_dir="$(dirname "${BASH_SOURCE[0]}")"
GIT_DIR="$(realpath $(dirname ${BASH_SOURCE[0]})/..)"

# make sure we're running as the owner of the checkout directory
RUN_AS="$(ls -ld "$scripts_dir" | awk 'NR==1 {print $3}')"
if [ "$USER" != "$RUN_AS" ]
then
    echo "This script must run as $RUN_AS, trying to change user..."
    exec sudo -u $RUN_AS $0
fi

echo ""
echo "Setting Up Alexa Smart Screen........"
echo ""

cd ${GIT_DIR}/Alexa/

# Setup APL Core Library
git clone --single-branch --branch v1.2 git://github.com/alexa/apl-core-library.git
cd $HOME/sdk_folder/apl-core-library
if [ ! -d build ]
then
  mkdir build
fi
cd build
cmake ..
make

# Setup Screen Dependencies
cd third-party
wget https://github.com/zaphoyd/websocketpp/archive/0.8.1.tar.gz -O websocketpp-0.8.1.tar.gz
tar -xvzf websocketpp-0.8.1.tar.gz

sudo apt-get -y install libasio-dev --no-install-recommends

curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
sudo apt-get install -y nodejs

sudo cp ${GIT_DIR}/Alexa/build/Integration/AlexaClientSDKConfig.json ${GIT_DIR}/Alexa/Backup-AlexaClientSDKConfig.json

cd ${GIT_DIR}/Alexa/
sudo chmod +x ./cmake-device.sh
sudo chmod +x ./cmake-screen.sh
sudo ./cmake-device.sh
git clone git://github.com/shivasiddharth/alexa-smart-screen-sdk.git
sudo ./cmake-screen.sh

sudo cp ${GIT_DIR}/Alexa/Backup-AlexaClientSDKConfig.json ${GIT_DIR}/Alexa/build/Integration/AlexaClientSDKConfig.json
