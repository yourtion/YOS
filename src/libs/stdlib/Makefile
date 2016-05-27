ROOTPATH = ../../
RULEFILE = $(ROOTPATH)ruls/haribote_app.rul

include $(ROOTPATH)tools.mk

OBJS_API = stdlib.obj

#默认动作

default :
	$(MAKE) stdlib.lib

#库生成规则

stdlib.lib : Makefile $(OBJS_API)
	$(GOLIB) $(OBJS_API) out:stdlib.lib

#命令

clean :
	-$(DEL) *.lst
	-$(DEL) *.obj

src_only :
	$(MAKE) clean
	-$(DEL) stdlib.lib