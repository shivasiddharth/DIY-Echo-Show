# DIY-Echo-Show
## Make your own Amazon Echo Show     

*******************************************************************************************************************************
### **If you like the work, find it useful and if you would like to get me a :coffee: :smile:** [![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=7GH3YDCHZ36QN)  

****************************************************************   
### How to Video    
****************************************************************    
<a href="http://www.youtube.com/watch?feature=player_embedded&v=OLc5EpjWpuw
" target="_blank"><img src="http://img.youtube.com/vi/OLc5EpjWpuw/0.jpg"
alt="Detailed Youtube Video" width="240" height="180" border="10" /></a>

****************************************************************   
### Before Starting the setup   
****************************************************************  

1. Create a security profile for alexa-avs-sample-app if you already don't have one.  
https://github.com/alexa/avs-device-sdk/wiki/Create-Security-Profile  

2. Download the **"config.json"** file and place it in the **/home/pi/DIY-Echo-Show/Alexa** directory.  


***************************************************************
### Setup       
***************************************************************
1. Clone the git using:
```
git clone https://github.com/shivasiddharth/DIY-Echo-Show  
```
2. Make the installers executable using:
```
sudo chmod +x /home/pi/DIY-Echo-Show/scripts/prep-system.sh    
sudo chmod +x /home/pi/DIY-Echo-Show/scripts/audio-test.sh   
sudo chmod +x /home/pi/DIY-Echo-Show/scripts/alexa-voice-installer.sh  
sudo chmod +x /home/pi/DIY-Echo-Show/scripts/alexa-screen-installer.sh    
sudo chmod +x /home/pi/DIY-Echo-Show/Alexa/cmake-device.sh  
sudo chmod +x /home/pi/DIY-Echo-Show/Alexa/cmake-screen.sh  
```
3. Prepare the system for installing assistants by updating, upgrading and setting up audio using:  
```
sudo /home/pi/DIY-Echo-Show/scripts/prep-system.sh
```
4. Restart the Pi using:
```
sudo reboot
```
5. Make sure that contents of asoundrc match the contents of asound.conf    
   Open a terminal and type:  
```
sudo nano /etc/asound.conf
```
Open a second terminal and type:    
```
sudo nano ~/.asoundrc
```
If the contents of .asoundrc are not same as asound.conf, make them both same.  

6. Bonus Script - Test the audio setup using the following code (optional). **Dont panic if the test does not go through successfully, proceed with the installation**:  
```
sudo /home/pi/DIY-Echo-Show/scripts/audio-test.sh  
```
7. Restart the Pi using:
```
sudo reboot
```
8. Install the Alexa voice first using the following. This is an interactive script, so just follow the onscreen instructions:
```
sudo /home/pi/DIY-Echo-Show/scripts/alexa-voice-installer.sh  
```  

9. Authorize Alexa    
```
sudo /home/pi/DIY-Echo-Show/Alexa/startsample.sh  
```

10. Install the Alexa screen now using the following:   
```

sudo /home/pi/DIY-Echo-Show/scripts/alexa-screen-installer.sh  
```  

11. Try starting the assistant using the following for authentication:   
```
sudo chmod +x /home/pi/DIY-Echo-Show/Alexa/startsampleassistant.sh
sudo /home/pi/DIY-Echo-Show/Alexa/startsampleassistant.sh  
```  

12. After authentication start the assistant and smart screen using:   
```
sudo chmod +x /home/pi/DIY-Echo-Show/Alexa/start-assistant.sh  
sudo chmod +x /home/pi/DIY-Echo-Show/Alexa/start-screen.sh  
sudo /home/pi/DIY-Echo-Show/Alexa/start-assistant.sh  
sudo /home/pi/DIY-Echo-Show/Alexa/start-screen.sh  
```  

13. For voice activation/wakeword, use:   
```
python3 /home/pi/DIY-Echo-Show/snowboy/voiceactivation.py
```  
