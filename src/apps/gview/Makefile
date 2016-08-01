APP      = gview
STACK    = 4480k
MALLOC   = 0k

ROOTPATH = ../../
RULEFILE = $(ROOTPATH)ruls/haribote_app.rul
include $(ROOTPATH)tools.mk

#默认动作

default :
	$(MAKE) $(APP).hrb

#文件生成规则

$(APP).bim : $(APP).obj bmp.obj jpeg.obj $(APILIBPATH)apilib.lib Makefile 
	$(OBJ2BIM) @$(RULEFILE) out:$(APP).bim map:$(APP).map stack:$(STACK) \
		$(APP).obj jpeg.obj bmp.obj $(APILIBPATH)apilib.lib

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

src_only :
	$(MAKE) clean
