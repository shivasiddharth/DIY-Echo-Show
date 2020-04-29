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

cd ${GIT_DIR}/Alexa/ss-build
./modules/Alexa/SampleApp/src/SampleApp -C \
/home/pi/DIY-Echo-Show/Alexa/build/Integration/AlexaClientSDKConfig.json -C \
/home/pi/DIY-Echo-Show/Alexa/alexa-smart-screen-sdk/modules/GUI/config/SmartScreenSDKConfig.json -L INFO
