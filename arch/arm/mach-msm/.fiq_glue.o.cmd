cmd_arch/arm/mach-msm/fiq_glue.o := arm-eabi-gcc -Wp,-MD,arch/arm/mach-msm/.fiq_glue.o.d  -nostdinc -isystem /home/austrie/myandroid/prebuilt/linux-x86/toolchain/arm-eabi-4.4.0/bin/../lib/gcc/arm-eabi/4.4.0/include -Iinclude  -I/home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include -include include/linux/autoconf.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-msm/include -D__ASSEMBLY__ -mabi=aapcs-linux -mno-thumb-interwork -funwind-tables  -D__LINUX_ARM_ARCH__=7 -march=armv7-a  -include asm/unified.h -msoft-float      -O1 -mtune=cortex-a8 -ftree-vectorize -ffast-math -fsingle-precision-constant -march=armv7-a -mfpu=vfpv3 -c -o arch/arm/mach-msm/fiq_glue.o arch/arm/mach-msm/fiq_glue.S

deps_arch/arm/mach-msm/fiq_glue.o := \
  arch/arm/mach-msm/fiq_glue.S \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/unified.h \
    $(wildcard include/config/arm/asm/unified.h) \
    $(wildcard include/config/thumb2/kernel.h) \
  include/linux/linkage.h \
  include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/linkage.h \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/assembler.h \
    $(wildcard include/config/cpu/feroceon.h) \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/smp.h) \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/ptrace.h \
    $(wildcard include/config/cpu/endian/be8.h) \
    $(wildcard include/config/arm/thumb.h) \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/hwcap.h \

arch/arm/mach-msm/fiq_glue.o: $(deps_arch/arm/mach-msm/fiq_glue.o)

$(deps_arch/arm/mach-msm/fiq_glue.o):
