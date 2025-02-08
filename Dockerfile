FROM ubuntu:24.04
RUN apt update && apt upgrade -y
RUN apt install git cmake make libopencv-dev -y
RUN apt install g++ libairspy-dev librtlsdr-dev -y
RUN git clone --recursive https://github.com/pietern/goestools
RUN cmake -S goestools -B goestools/build
RUN cmake --build goestools/build
RUN apt install rtl-sdr -y
RUN apt install vim -y
RUN cp goestools/build/src/goesrecv/goesrecv /usr/bin
RUN cp goestools/build/src/goesproc/goesproc /usr/bin
COPY goesproc.conf /
COPY goesrecv.conf /
RUN apt install linux-tools-generic -y
RUN rm /usr/bin/usbip
RUN ln -s /usr/lib/linux-tools-6.8.0-52/usbip /usr/bin/usbip