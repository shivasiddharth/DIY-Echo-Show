#!/bin/bash

if [ ! -d ss-build ]
then
  mkdir ss-build
fi

cd ss-build

sudo cmake -DCMAKE_PREFIX_PATH=/home/pi/DIY-Echo-Show/Alexa/sdk-install \
 -DWEBSOCKETPP_INCLUDE_DIR=/home/pi/DIY-Echo-Show/Alexa/third-party/websocketpp-0.8.1 \
 -DDISABLE_WEBSOCKET_SSL=ON \
 -DGSTREAMER_MEDIA_PLAYER=ON \
 -DCMAKE_BUILD_TYPE=DEBUG \
 -DPORTAUDIO=ON -DPORTAUDIO_LIB_PATH=/home/pi/DIY-Echo-Show/Alexa/third-party/portaudio/lib/.libs/libportaudio.a \
 -DPORTAUDIO_INCLUDE_DIR=/home/pi/DIY-Echo-Show/Alexa/third-party/portaudio/include/ \
 -DAPL_CORE=ON \
 -DAPLCORE_INCLUDE_DIR=/home/pi/DIY-Echo-Show/Alexa/apl-core-library/aplcore/include \
 -DAPLCORE_LIB_DIR=/home/pi/DIY-Echo-Show/Alexa/apl-core-library/build/aplcore \
 -DYOGA_INCLUDE_DIR=/home/pi/DIY-Echo-Show/Alexa/apl-core-library/build/yoga-prefix/src/yoga \
 -DYOGA_LIB_DIR=/home/pi/DIY-Echo-Show/Alexa/apl-core-library/build/lib \
 -DSENSORY_KEY_WORD_DETECTOR=ON \
 -DSENSORY_KEY_WORD_DETECTOR_LIB_PATH=/home/pi/DIY-Echo-Show/Alexa/third-party/alexa-rpi/lib/libsnsr.a \
 -DSENSORY_KEY_WORD_DETECTOR_INCLUDE_DIR=/home/pi/DIY-Echo-Show/Alexa/third-party/alexa-rpi/include \
  ../alexa-smart-screen-sdk

sudo make
