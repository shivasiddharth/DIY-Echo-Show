#!/bin/bash

set -o errexit

scripts_dir="$(dirname "${BASH_SOURCE[0]}")"
GIT_DIR="$(realpath $(dirname ${BASH_SOURCE[0]})/..)"


cd ${GIT_DIR}/Alexa/ss-build
./modules/Alexa/SampleApp/src/SampleApp -C \
/home/pi/DIY-Echo-Show/Alexa/build/Integration/AlexaClientSDKConfig.json -C \
/home/pi/DIY-Echo-Show/Alexa/alexa-smart-screen-sdk/modules/GUI/config/SmartScreenSDKConfig.json -L INFO
