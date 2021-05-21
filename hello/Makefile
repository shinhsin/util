PWD := $(shell pwd)
KVERSION := $(shell uname -r)
KDIR = /usr/src/linux-headers-$(KVERSION)/

MODULE_NAME = hello
obj-m := $(MODULE_NAME).o


#Default target is modules
all:
	make -C $(KDIR) M=$(PWD)

clean:
	make -C $(KDIR) M=$(PWD) clean
