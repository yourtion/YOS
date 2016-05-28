ROOTPATH = ../../
RULEFILE = $(ROOTPATH)ruls/haribote_app.rul

include $(ROOTPATH)tools.mk

OBJS_API = stdlibs.obj

#默认动作

default :
	$(MAKE) stdlibs.lib

#库生成规则

stdlibs.lib : Makefile $(OBJS_API)
	$(GOLIB) $(OBJS_API) out:stdlibs.lib

#命令

clean :
	-$(DEL) *.lst
	-$(DEL) *.obj

src_only :
	$(MAKE) clean
	-$(DEL) stdlibs.lib