ROOTPATH = ../../

RULEFILE = $(ROOTPATH)ruls/haribote_app.rul
include $(ROOTPATH)tools.mk

#默认动作

default :
	$(MAKE) $(APP).hrb

#文件生成规则

$(APP).bim : $(APP).obj $(APILIBPATH)apilib.lib $(STDLIBPATH)stdlib.lib Makefile $(APPMKFILE)
	$(OBJ2BIM) @$(RULEFILE) out:$(APP).bim map:$(APP).map stack:$(STACK) \
		$(APP).obj $(APILIBPATH)apilib.lib $(STDLIBPATH)stdlib.lib

#命令

full :
	$(MAKE) -C $(APILIBPATH)
	$(MAKE) -C $(STDLIBPATH)
	$(MAKE) $(APP).hrb

clean :
	-$(DEL) *.lst
	-$(DEL) *.hrb
	-$(DEL) *.nas
	-$(DEL) *.gas
	-$(DEL) *.obj
	-$(DEL) *.map
	-$(DEL) *.bim
	-$(DEL) *.org
	-$(DEL) haribote.img

src_only :
	$(MAKE) clean
	-$(DEL) $(APP).hrb
