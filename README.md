Based on:
https://hub.docker.com/r/consol/ubuntu-icewm-vnc/

docker run -it -p 5901:5901 -p 6901:6901 -e VNC_PW=strong*password -e VNC_RESOLUTION=1024x640 ekkus93/councilmatic-etl

http://localhost:6901/?password=strong*password


