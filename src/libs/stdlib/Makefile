TOOLSDIR = ../../../
RULEFILE = ../../ruls/haribote_app.rul

include ../../tools.mk

OBJS_API =	stdlib.obj

#默认动作

default :
	$(MAKE) stdlib.lib

#库生成规则

stdlib.lib : Makefile $(OBJS_API)
	$(GOLIB) $(OBJS_API) out:stdlib.lib

#文件生成规则

%.gas : %.c ../stdlib.h Makefile
	$(CC1) -o $*.gas $*.c

%.nas : %.gas Makefile
	$(GAS2NASK) $*.gas $*.nas

%.obj : %.nas Makefile
	$(NASK) $*.nas $*.obj $*.lst

#命令

clean :
	-$(DEL) *.lst
	-$(DEL) *.obj

src_only :
	$(MAKE) clean
	-$(DEL) stdlib.lib