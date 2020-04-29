if [ ! -d ss-build ]
then
  mkdir ss-build
fi
cd ss-build
cmake /home/pi/DIY-Echo-Show/Alexa/avs-device-sdk
 -DSENSORY_KEY_WORD_DETECTOR=ON
 -DGSTREAMER_MEDIA_PLAYER=ON
 -DPORTAUDIO=ON
 -DPORTAUDIO_LIB_PATH=/home/pi/DIY-Echo-Show/Alexa/third-party/portaudio/lib/.libs/libportaudio.a
 -DPORTAUDIO_INCLUDE_DIR=/home/pi/DIY-Echo-Show/Alexa/third-party/portaudio/include
 -DCMAKE_BUILD_TYPE=DEBUG
 -DSENSORY_KEY_WORD_DETECTOR_LIB_PATH=/home/pi/DIY-Echo-Show/Alexa/third-party/alexa-rpi/lib/libsnsr.a
 -DSENSORY_KEY_WORD_DETECTOR_INCLUDE_DIR=/home/pi/DIY-Echo-Show/Alexa/third-party/alexa-rpi/include
 -DCMAKE_INSTALL_PREFIX=/home/pi/DIY-Echo-Show/Alexa/sdk-install

make install
