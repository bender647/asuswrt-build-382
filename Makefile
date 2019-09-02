# Ken's master makefile to build asuswrt 382 firmware for RT-AC66 router
# We use a Slackware-14.2 stock machine to build.  No extra dependencies.
# MIPS (RT-N66U, RT-AC66U): 
export PATH := $(PATH):$(PWD)/asuswrt/tools/brcm/hndtools-mipsel-linux/bin:$(PWD)/asuswrt/tools/brcm/hndtools-mipsel-uclibc/bin

rt-ac66u:
	$(MAKE) -C asuswrt/release/src-rt-6.x rt-ac66u

clean:
	$(MAKE) -C asuswrt/release/src-rt-6.x clean

patch:
	sed -i -e "s|/opt/brcm/K26/hndtools-mipsel-linux-uclibc-4.2.3|$(PWD)/asuswrt/tools/brcm/K26/hndtools-mipsel-linux-uclibc-4.2.3|" asuswrt/release/src/router/common.mak

unpatch:
	cd asuswrt/release/src/router && git checkout common.mak

install:
	cp -a asuswrt/release/src-rt-6.x/image/RT-AC66U_*.trx .

package:
	cp asuswrt/README.TXT .
	cp asuswrt/License .
	sha256sum $(shell ls -v1 RT-AC66U_*.trx|tail -1) > sha256sum.sha256
	zip $(shell basename $(shell ls -v1 RT-AC66U_*.trx|tail -1) .trx).zip $(shell ls -v1 RT-AC66U_*.trx|tail -1) README.TXT License sha256sum.sha256
	rm README.TXT License sha256sum.sha256
