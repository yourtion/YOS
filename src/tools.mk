UNAME := $(shell uname)
ifeq ($(OS),Windows_NT)
	MAKE     = $(TOOLPATH)make.exe -r
	NASK     = $(TOOLPATH)nask.exe
	CC1      = $(TOOLPATH)cc1.exe -I$(INCPATH) -Os -Wall -quiet
	GAS2NASK = $(TOOLPATH)gas2nask.exe -a
	OBJ2BIM  = $(TOOLPATH)obj2bim.exe
	MAKEFONT = $(TOOLPATH)makefont.exe
	BIN2OBJ  = $(TOOLPATH)bin2obj.exe
	BIM2HRB  = $(TOOLPATH)bim2hrb.exe
	BIM2BIN  = $(TOOLPATH)bim2bin.exe
	EDIMG    = $(TOOLPATH)edimg.exe
	IMGTOL   = $(TOOLPATH)imgtol.com
	GOLIB    = $(TOOLPATH)golib00.exe
	COPY     = copy
	DEL      = del
	TOOLPATH = $(TOOLSDIR)tools/windows/
	COPYSYS  = copy /B asmhead.bin+bootpack.hrb haribote.sys
else
ifeq ($(UNAME), Darwin)
	CC1      = $(TOOLPATH)gocc1 -I$(INCPATH) -Os -Wall -quiet 
	TOOLPATH = $(TOOLSDIR)tools/osx/
else
	CC1      = $(TOOLPATH)cc1 -I $(INCPATH) -Os -Wall -quiet 
	TOOLPATH = $(TOOLSDIR)tools/linux/
endif
	MAKE     = make -r  
	NASK     = $(TOOLPATH)nask   
	GAS2NASK = $(TOOLPATH)gas2nask -a  
	OBJ2BIM  = $(TOOLPATH)obj2bim  
	BIN2OBJ  = $(TOOLPATH)bin2obj  
	BIM2HRB  = $(TOOLPATH)bim2hrb  
	EDIMG    = $(TOOLPATH)edimg  
	IMGTOL   = $(TOOLPATH)imgtol.com  
	MAKEFONT = $(TOOLPATH)makefont  
	GOLIB    = $(TOOLPATH)golib00  
	COPY     = cp  
	DEL      = rm  
	COPYSYS  = cat asmhead.bin bootpack.hrb > haribote.sys
endif

LIBPATH   = $(ROOTPATH)libs/
APILIBPATH = $(LIBPATH)apilib/
STDLIBPATH = $(LIBPATH)stdlibs/
INCPATH  = $(ROOTPATH)includes/

HARIBOTEPATH = $(ROOTPATH)kernel/
TOOLSDIR = $(ROOTPATH)../

APPMKFILE = $(ROOTPATH)app.mk

# 其他指令

%.gas : %.c $(INCPATH)apilib.h $(INCPATH)stdlibs.h Makefile
	$(CC1) -o $*.gas $*.c

%.nas : %.gas Makefile
	$(GAS2NASK) $*.gas $*.nas

%.obj : %.nas Makefile
	$(NASK) $*.nas $*.obj $*.lst

%.org : %.bim Makefile
	$(BIM2HRB) $*.bim $*.org $(MALLOC)

%.hrb : %.org Makefile
	$(COPY) $(APP).org $(APP).hrb
