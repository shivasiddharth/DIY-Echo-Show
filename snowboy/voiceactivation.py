import snowboydecoder
import sys
import signal
import sys
import subprocess
from sys import byteorder
from array import array
from struct import pack
import pyaudio
import wave

THRESHOLD = 1000
CHUNK_SIZE = 1024
FORMAT = pyaudio.paInt16
RATE = 44100

def is_silent(snd_data):
    "Returns 'True' if below the 'silent' threshold"
    return max(snd_data) < THRESHOLD

def pressholdtotalk():
    """
    Record a word or words from the microphone and
    return the data as an array of signed shorts.

    Normalizes the audio, trims silence from the
    start and end, and pads with 0.5 seconds of
    blank sound to make sure VLC et al can play
    it without getting chopped off.
    """
    subprocess.call("wmctrl -a Chromium",shell=True)

    p = pyaudio.PyAudio()
    stream = p.open(format=FORMAT, channels=1, rate=RATE,
        input=True, output=True,
        frames_per_buffer=CHUNK_SIZE)

    num_silent = 0
    snd_started = False

    r = array('h')

    while 1:
        subprocess.call("xdotool keydown A", shell=True)

        # little endian, signed short
        snd_data = array('h', stream.read(CHUNK_SIZE))
        if byteorder == 'big':
            snd_data.byteswap()
        r.extend(snd_data)

        silent = is_silent(snd_data)

        if silent and snd_started:
            num_silent += 1
        elif not silent and not snd_started:
            snd_started = True

        if snd_started and num_silent > 100:
            break

    stream.stop_stream()
    stream.close()
    p.terminate()
    subprocess.call("xdotool keyup A", shell=True)
    
def taptotalk():
    subprocess.call("wmctrl -a Chromium",shell=True)
    subprocess.call("xdotool key A", shell=True)

interrupted = False

def signal_handler(signal, frame):
    global interrupted
    interrupted = True

def interrupt_callback():
    global interrupted
    return interrupted    

model = "/home/pi/DIY-Echo-Show/snowboy/resources/alexa.umdl"

# capture SIGINT signal, e.g., Ctrl+C
signal.signal(signal.SIGINT, signal_handler)

detector = snowboydecoder.HotwordDetector(model, sensitivity=0.5)
print('Listening... Press Ctrl+C to exit')

# main loop
detector.start(detected_callback=taptotalk,
               interrupt_check=interrupt_callback,
               sleep_time=0.03)

detector.terminate()
