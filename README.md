# smart-camera

## Fan control setup 

 1. Make sure you place 'fan_control.sh' in the '/usr/bin/' directory.
 
 2. Run the following in the terminal
 
     $ sudo crontab -e
     
 3. Add the following to the end of the crontab with no ""
 
 
    " * * * * *  /bin/sh /usr/bin/fan_control.sh "
