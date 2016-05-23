APP      = gview
STACK    = 4480k
MALLOC   = 0k

TOOLPATH = ../../../tools/windows/
INCPATH  = ../../../tools/windows/haribote/
APILIBPATH   = ../../libs/apilib/
HARIBOTEPATH = ../../kernel/

MAKE     = $(TOOLPATH)make.exe -r
NASK     = $(TOOLPATH)nask.exe
CC1      = $(TOOLPATH)cc1.exe -I$(INCPATH) -I../ -Os -Wall -quiet
GAS2NASK = $(TOOLPATH)gas2nask.exe -a
OBJ2BIM  = $(TOOLPATH)obj2bim.exe
MAKEFONT = $(TOOLPATH)makefont.exe
BIN2OBJ  = $(TOOLPATH)bin2obj.exe
BIM2HRB  = $(TOOLPATH)bim2hrb.exe
BIM2BIN  = $(TOOLPATH)bim2bin.exe
RULEFILE = ../../haribote.rul
EDIMG    = $(TOOLPATH)edimg.exe
IMGTOL   = $(TOOLPATH)imgtol.com
GOLIB    = $(TOOLPATH)golib00.exe 
COPY     = copy
DEL      = del

#默认动作

default :
	$(MAKE) $(APP).hrb

#文件生成规则

$(APP).bim : $(APP).obj bmp.obj jpeg.obj $(APILIBPATH)apilib.lib Makefile
	$(OBJ2BIM) @$(RULEFILE) out:$(APP).bim map:$(APP).map stack:$(STACK) \
		$(APP).obj jpeg.obj bmp.obj $(APILIBPATH)apilib.lib

# 其他指令

%.gas : %.c ../libs/apilib.h Makefile
	$(CC1) -o $*.gas $*.c

%.nas : %.gas Makefile
	$(GAS2NASK) $*.gas $*.nas

%.obj : %.nas Makefile
	$(NASK) $*.nas $*.obj $*.lst

%.org : %.bim Makefile
	$(BIM2HRB) $*.bim $*.org $(MALLOC)

%.hrb : %.org Makefile
	$(BIM2BIN) -osacmp in:$*.org out:$*.hrb

# 运行程序

run :
	$(MAKE) haribote.img
	$(COPY) haribote.img ..\..\..\tools\windows\qemu\fdimage0.bin
	$(MAKE) -C ../../../tools/windows/qemu

full :
	$(MAKE) -C $(APILIBPATH)
	$(MAKE) $(APP).hrb

run_full :
	$(MAKE) -C $(APILIBPATH)
	$(MAKE) -C ../haribote
	$(MAKE) run

clean :
	-$(DEL) *.lst
	-$(DEL) gview.obj
	-$(DEL) jpeg.obj
	-$(DEL) *.map
	-$(DEL) *.bim
	-$(DEL) *.org
	-$(DEL) haribote.img

src_only :
	$(MAKE) clean
	-$(DEL) $(APP).hrb
