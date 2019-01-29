echo "setup RPi3 system"

echo "update system"
sudo apt-get update

echo "setup basic libs"
sudo apt-get install build-essential libfontconfig1-dev libdbus-1-dev \
libfreetype6-dev libicu-dev libinput-dev libxkbcommon-dev libsqlite3-dev \
libssl-dev libpng-dev libjpeg-dev libglib2.0-dev libraspberrypi-dev cmake \
libtiff-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
libx264-dev mc cmake

echo "setup gstreamer"
sudo apt-get install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev \
gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-tools

echo "make BCM sym-links"
sudo ln -s /usr/lib/libbrcmEGL.so /usr/lib/libEGL.so
sudo ln -s /usr/lib/libbrcmGLESv2.so /usr/lib/libGLESv2.so
sudo ln -s /usr/lib/libbrcmOpenVG.so /usr/lib/libOpenVG.so
sudo ln -s /usr/lib/libbrcmWFC.so /usr/lib/libWFC.so

sudo ln -s /opt/vc/include/EGL /usr/include/EGL
sudo ln -s /opt/vc/include/GLES /usr/include/GLES
sudo ln -s /opt/vc/include/GLES2 /usr/include/GLES2
sudo ln -s /opt/vc/include/KHR /usr/include/KHR
sudo ln -s /opt/vc/include/IL /usr/include/IL
sudo ln -s /opt/vc/include/VG /usr/include/VG
sudo ln -s /opt/vc/include/WF /usr/include/WF
sudo ln -s /opt/vc/include/interface /usr/include/interface
sudo ln -s /opt/vc/include/vcinclude /usr/include/vcinclude
sudo ln -s /opt/vc/include/bcm_host.h /usr/include/bcm_host.h

echo "bcm2835-v4l2" | sudo tee /etc/modules
sudo modprobe bcm2835-v4l2

echo "RPi3 system is OK"

echo "Camera check"
vcgencmd get_camera
v4l2-ctl --list-formats
