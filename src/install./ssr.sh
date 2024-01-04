sudo apt-get install build-essential cmake pkg-config desktop-file-utils libgl1-mesa-dev libglu1-mesa-dev \
qt5-qmake qttools5-dev qtbase5-dev libqt5x11extras5-dev libavformat-dev libavcodec-dev libavutil-dev \
libswscale-dev libasound2-dev libpulse-dev libjack-dev libx11-dev libxext-dev libxfixes-dev libxi-dev \
libxinerama-dev libv4l-dev

sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install g++-multilib libgl1-mesa-dev:i386 libglu1-mesa-dev:i386 libx11-dev:i386 libxfixes-dev:i386

sudo apt-get install g++-multilib libglu1-mesa:i386 libx11-dev:i386 libxfixes-dev:i386
mkdir -p ~/tmp
cd ~/tmp
git clone https://github.com/MaartenBaert/ssr.git
cd ssr
./simple-build-and-install

