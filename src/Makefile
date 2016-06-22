ROOTPATH = ./

include tools.mk

#默认动作

default :
	$(MAKE) haribote.img

#文件生成规则

haribote.img : kernel/ipl10.bin kernel/haribote.sys Makefile \
		demos/a/a.hrb demos/hello3/hello3.hrb demos/hello4/hello4.hrb \
		demos/winhelo/winhelo.hrb demos/winhelo2/winhelo2.hrb demos/winhelo3/winhelo3.hrb \
		demos/star1/star1.hrb demos/stars/stars.hrb demos/stars2/stars2.hrb \
		demos/lines/lines.hrb apps/walk/walk.hrb demos/noodle/noodle.hrb \
		demos/beepdown/beepdown.hrb demos/color/color.hrb demos/color2/color2.hrb \
		demos/sosu/sosu.hrb demos/sosu2/sosu2.hrb demos/sosu3/sosu3.hrb \
		apps/type/type.hrb apps/iroha/iroha.hrb demos/chklang/chklang.hrb \
		demos/notrec/notrec.hrb demos/bball/bball.hrb apps/invader/invader.hrb \
		apps/calc/calc.hrb apps/tview/tview.hrb apps/mmlplay/mmlplay.hrb apps/gview/gview.hrb
	$(EDIMG)   imgin:../tools/windows/fdimg0at.tek \
		wbinimg src:kernel/ipl10.bin len:512 from:0 to:0 \
		copy from:kernel/haribote.sys to:@: \
		copy from:kernel/jp.nas to:@: \
		copy from:make.bat to:@: \
		copy from:demos/a/a.hrb to:@: \
		copy from:demos/hello3/hello3.hrb to:@: \
		copy from:demos/hello4/hello4.hrb to:@: \
		copy from:demos/winhelo/winhelo.hrb to:@: \
		copy from:demos/winhelo2/winhelo2.hrb to:@: \
		copy from:demos/winhelo3/winhelo3.hrb to:@: \
		copy from:demos/star1/star1.hrb to:@: \
		copy from:demos/stars/stars.hrb to:@: \
		copy from:demos/stars2/stars2.hrb to:@: \
		copy from:demos/lines/lines.hrb to:@: \
		copy from:apps/walk/walk.hrb to:@: \
		copy from:demos/noodle/noodle.hrb to:@: \
		copy from:demos/beepdown/beepdown.hrb to:@: \
		copy from:demos/color/color.hrb to:@: \
		copy from:demos/color2/color2.hrb to:@: \
		copy from:demos/sosu/sosu.hrb to:@: \
		copy from:demos/sosu2/sosu2.hrb to:@: \
		copy from:demos/sosu3/sosu3.hrb to:@: \
		copy from:apps/type/type.hrb to:@: \
		copy from:apps/iroha/iroha.hrb to:@: \
		copy from:demos/chklang/chklang.hrb to:@: \
		copy from:euc.txt to:@: \
		copy from:demos/notrec/notrec.hrb to:@: \
		copy from:demos/bball/bball.hrb to:@: \
		copy from:apps/invader/invader.hrb to:@: \
		copy from:apps/calc/calc.hrb to:@: \
		copy from:apps/tview/tview.hrb to:@: \
		copy from:apps/mmlplay/mmlplay.hrb to:@: \
		copy from:media/kirakira.mml to:@: \
		copy from:media/fujisan.mml to:@: \
		copy from:media/daigo.mml to:@: \
		copy from:media/daiku.mml to:@: \
		copy from:media/cn.txt to:@: \
		copy from:apps/gview/gview.hrb to:@: \
		copy from:media/fujisan.jpg to:@: \
		copy from:media/night.bmp to:@: \
		copy from:font/chinese.fnt to:@: \
		imgout:haribote.img

#命令

run :
	$(MAKE) haribote.img
ifeq ($(UNAME), Darwin)
	qemu-system-i386 -fda haribote.img
else
	$(COPY) haribote.img ..\tools\windows\qemu\fdimage0.bin
	$(MAKE) -C ../tools/windows/qemu
endif

install :
	$(MAKE) haribote.img
	$(IMGTOL) w a: haribote.img

full :
	$(MAKE) -C kernel
	$(MAKE) -C libs/apilib
	$(MAKE) -C libs/stdlibs
	$(MAKE) -C demos/a
	$(MAKE) -C demos/hello3
	$(MAKE) -C demos/hello4
	$(MAKE) -C demos/winhelo
	$(MAKE) -C demos/winhelo2
	$(MAKE) -C demos/winhelo3
	$(MAKE) -C demos/star1
	$(MAKE) -C demos/stars
	$(MAKE) -C demos/stars2
	$(MAKE) -C demos/lines
	$(MAKE) -C apps/walk
	$(MAKE) -C demos/noodle
	$(MAKE) -C demos/beepdown
	$(MAKE) -C demos/color
	$(MAKE) -C demos/color2
	$(MAKE) -C demos/sosu
	$(MAKE) -C demos/sosu2
	$(MAKE) -C demos/sosu3
	$(MAKE) -C apps/type
	$(MAKE) -C apps/iroha
	$(MAKE) -C demos/chklang
	$(MAKE) -C demos/notrec
	$(MAKE) -C demos/bball
	$(MAKE) -C apps/invader
	$(MAKE) -C apps/calc
	$(MAKE) -C apps/tview
	$(MAKE) -C apps/mmlplay
	$(MAKE) -C apps/gview
	$(MAKE) haribote.img

run_full :
	$(MAKE) full
	$(MAKE) run

install_full :
	$(MAKE) full
	$(IMGTOL) w a: haribote.img

run_os :
	$(MAKE) -C haribote
	$(MAKE) run

clean :
#不执行任何操作

src_only :
	$(MAKE) clean
	-$(DEL) haribote.img

clean_full :
	$(MAKE) -C kernel			clean
	$(MAKE) -C libs/apilib		clean
	$(MAKE) -C libs/stdlibs		clean
	$(MAKE) -C demos/a			clean
	$(MAKE) -C demos/hello3		clean
	$(MAKE) -C demos/hello4		clean
	$(MAKE) -C demos/winhelo	clean
	$(MAKE) -C demos/winhelo2	clean
	$(MAKE) -C demos/winhelo3	clean
	$(MAKE) -C demos/star1		clean
	$(MAKE) -C demos/stars		clean
	$(MAKE) -C demos/stars2		clean
	$(MAKE) -C demos/lines		clean
	$(MAKE) -C demos/walk		clean
	$(MAKE) -C demos/noodle		clean
	$(MAKE) -C demos/beepdown	clean
	$(MAKE) -C demos/color		clean
	$(MAKE) -C demos/color2		clean
	$(MAKE) -C demos/sosu		clean
	$(MAKE) -C demos/sosu2		clean
	$(MAKE) -C demos/sosu3		clean
	$(MAKE) -C apps/type		clean
	$(MAKE) -C apps/iroha		clean
	$(MAKE) -C demos/chklang	clean
	$(MAKE) -C demos/notrec		clean
	$(MAKE) -C demos/bball		clean
	$(MAKE) -C apps/invader		clean
	$(MAKE) -C apps/calc		clean
	$(MAKE) -C apps/tview		clean
	$(MAKE) -C apps/mmlplay		clean
	$(MAKE) -C apps/gview		clean

src_only_full :
	$(MAKE) -C kernel		src_only
	$(MAKE) -C libs/apilib		src_only
	$(MAKE) -C libs/stdlibs		src_only
	$(MAKE) -C demos/a			src_only
	$(MAKE) -C demos/hello3		src_only
	$(MAKE) -C demos/hello4		src_only
	$(MAKE) -C demos/winhelo	src_only
	$(MAKE) -C demos/winhelo2	src_only
	$(MAKE) -C demos/winhelo3	src_only
	$(MAKE) -C demos/star1		src_only
	$(MAKE) -C demos/stars		src_only
	$(MAKE) -C demos/stars2		src_only
	$(MAKE) -C demos/lines		src_only
	$(MAKE) -C demos/walk		src_only
	$(MAKE) -C demos/noodle		src_only
	$(MAKE) -C demos/beepdown	src_only
	$(MAKE) -C demos/color		src_only
	$(MAKE) -C demos/color2		src_only
	$(MAKE) -C demos/sosu		src_only
	$(MAKE) -C demos/sosu2		src_only
	$(MAKE) -C demos/sosu3		src_only
	$(MAKE) -C apps/type		src_only
	$(MAKE) -C apps/iroha		src_only
	$(MAKE) -C demos/chklang	src_only
	$(MAKE) -C demos/notrec		src_only
	$(MAKE) -C demos/bball		src_only
	$(MAKE) -C apps/invader		src_only
	$(MAKE) -C apps/calc		src_only
	$(MAKE) -C apps/tview		src_only
	$(MAKE) -C apps/mmlplay		src_only
	$(MAKE) -C apps/gview		src_only
	-$(DEL) haribote.img

refresh :
	$(MAKE) full
	$(MAKE) clean_full
	-$(DEL) haribote.img
