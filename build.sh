sudo apt update && sudo apt upgrade -y && sudo apt install git cmake make libopencv-dev g++ libairspy-dev librtlsdr-dev rtl-sdr vim -y
git clone --recursive https://github.com/pietern/goestools
cmake -S goestools -B goestools/build
cmake --build goestools/build
