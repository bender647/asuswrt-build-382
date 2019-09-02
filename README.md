asuswrt-build-382
==============

Build wrapper for Asus AC-RT66U 3.0.0.4.382 router firmware.
[https://www.asus.com/us/Networking/RTAC66U/HelpDesk_Download/](https://www.asus.com/us/Networking/RTAC66U/HelpDesk_Download/)

About
-----
This is a makefile that sets up the build environment necessary to build the asuswrt mips firmwares.

It contains the firmware source as a submodule:

[https://github.com/bender647/asuswrt-382](https://github.com/bender647/asuswrt-382)

How to Use
-----
This was tested on a multi-lib, Slackware 14.2 64-bit machine:

~~~~
git clone --recursive-submodules https://github.org/bender647/asuswrt-build-382.git
cd asuswrt-build-382
mv asuswrt-382 asuswrt
make patch
make clean
make
make install
make package
~~~~

There should be no need to alter your filesystem or environment variables in your build environment.
