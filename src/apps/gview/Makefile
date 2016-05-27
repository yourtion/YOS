APP      = gview
STACK    = 4480k
MALLOC   = 0k

TOOLSDIR = ../../../
RULEFILE = ../../ruls/haribote_app.rul

include ../../tools.mk

APILIBPATH   = ../../libs/apilib/
STDLIBPATH   = ../../libs/stdlib/

#默认动作

default :
	$(MAKE) $(APP).hrb

#文件生成规则

$(APP).bim : $(APP).obj bmp.obj jpeg.obj $(APILIBPATH)apilib.lib Makefile
	$(OBJ2BIM) @$(RULEFILE) out:$(APP).bim map:$(APP).map stack:$(STACK) \
		$(APP).obj jpeg.obj bmp.obj $(APILIBPATH)apilib.lib

# 其他指令

%.gas : %.c ../apilib.h Makefile
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
full :
	$(MAKE) -C $(APILIBPATH)
	$(MAKE) $(APP).hrb

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
