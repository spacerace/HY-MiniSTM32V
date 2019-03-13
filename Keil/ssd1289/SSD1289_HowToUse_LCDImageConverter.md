# How to use LCDImageConverter

There is a tool, that supports creating RGB565 encoded headers from
image files.
See src/ssd1289/image_*.h files for examples.

# Settings in lcd-image-converter / Use it
Set to RGB565 color profile and import images of max. 240x320/320x240.
When created look at tImage in src/ssd1289/ssd1289.h and look at the
bottom of example images src/ssd1289/image_*.h.
You need to remove data size parameter from generated header, that's all.
You could also add a #ifndef-construct to prevent multiple including:
ifndef __YOURFILENAME_H__
define __YOURFILENAME_H__

.... your header file ....

endif

# Compiling LCDImageConverter
First of all you will need a few tools and libraries on your computer.
These steps are for Debian Systems (also Ubuntu, ...):

$ apt-get install build-essential qt4-qmake qt4-qconf lrelease qt4-linguist-tools libqt4-dev-bin libqt4-dev qt4-dev-tools 

After this we download and compile lcd-image-converter:

$ git clone https://github.com/riuson/lcd-image-converter.git ~/lcd-image-converter
$ cd ~/lcd-image-converter
$ qmake
$ make

Now we can run lcd-image-converter:

$ ./release/linux/output/lcd-image-converter

If you want to install it system-wide, you could do:

$ sudo cp release/linux/output/lcd-image-converter /usr/src/linux
