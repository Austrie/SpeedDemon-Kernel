cmd_arch/arm/mach-msm/qdsp5v2/mp3_funcs.o := arm-eabi-gcc -Wp,-MD,arch/arm/mach-msm/qdsp5v2/.mp3_funcs.o.d  -nostdinc -isystem /home/austrie/myandroid/prebuilt/linux-x86/toolchain/arm-eabi-4.4.0/bin/../lib/gcc/arm-eabi/4.4.0/include -Iinclude  -I/home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include -include include/linux/autoconf.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-msm/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -Werror -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -mabi=aapcs-linux -mno-thumb-interwork -funwind-tables -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -Wframe-larger-than=1024 -fno-stack-protector -fomit-frame-pointer -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fno-dwarf2-cfi-asm -fconserve-stack  -O1 -mtune=cortex-a8 -ftree-vectorize -ffast-math -fsingle-precision-constant -march=armv7-a -mfpu=vfpv3 -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(mp3_funcs)"  -D"KBUILD_MODNAME=KBUILD_STR(mp3_funcs)" -D"DEBUG_HASH=6" -D"DEBUG_HASH2=28" -c -o arch/arm/mach-msm/qdsp5v2/mp3_funcs.o arch/arm/mach-msm/qdsp5v2/mp3_funcs.c

deps_arch/arm/mach-msm/qdsp5v2/mp3_funcs.o := \
  arch/arm/mach-msm/qdsp5v2/mp3_funcs.c \
  include/linux/fs.h \
    $(wildcard include/config/dnotify.h) \
    $(wildcard include/config/sysfs.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/quota.h) \
    $(wildcard include/config/fsnotify.h) \
    $(wildcard include/config/inotify.h) \
    $(wildcard include/config/security.h) \
    $(wildcard include/config/fs/posix/acl.h) \
    $(wildcard include/config/preempt.h) \
    $(wildcard include/config/epoll.h) \
    $(wildcard include/config/debug/writecount.h) \
    $(wildcard include/config/file/locking.h) \
    $(wildcard include/config/auditsyscall.h) \
    $(wildcard include/config/block.h) \
    $(wildcard include/config/fs/xip.h) \
    $(wildcard include/config/migration.h) \
  include/linux/limits.h \
  include/linux/ioctl.h \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/ioctl.h \
  include/asm-generic/ioctl.h \
  include/linux/linkage.h \
  include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
  include/linux/compiler-gcc4.h \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/linkage.h \
  include/linux/wait.h \
    $(wildcard include/config/lockdep.h) \
  include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  include/linux/stddef.h \
  include/linux/poison.h \
  include/linux/prefetch.h \
  include/linux/types.h \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/types.h \
  include/asm-generic/int-ll64.h \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/bitsperlong.h \
  include/asm-generic/bitsperlong.h \
  include/linux/posix_types.h \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/posix_types.h \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/processor.h \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/cpu/32v6k.h) \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/ptrace.h \
    $(wildcard include/config/cpu/endian/be8.h) \
    $(wildcard include/config/arm/thumb.h) \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/hwcap.h \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/cache.h \
    $(wildcard include/config/arm/l1/cache/shift.h) \
    $(wildcard include/config/aeabi.h) \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/system.h \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/fa526.h) \
    $(wildcard include/config/arch/msm.h) \
    $(wildcard include/config/cpu/sa1100.h) \
    $(wildcard include/config/cpu/sa110.h) \
  include/linux/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
    $(wildcard include/config/x86.h) \
  include/linux/typecheck.h \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/irqflags.h \
  include/asm-generic/cmpxchg-local.h \
  include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/generic/lockbreak.h) \
    $(wildcard include/config/debug/lock/alloc.h) \
  include/linux/preempt.h \
    $(wildcard include/config/jrcu.h) \
    $(wildcard include/config/jrcu/lazy.h) \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/preempt/count/cpu.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  include/linux/thread_info.h \
    $(wildcard include/config/compat.h) \
  include/linux/bitops.h \
    $(wildcard include/config/generic/find/first/bit.h) \
    $(wildcard include/config/generic/find/last/bit.h) \
    $(wildcard include/config/generic/find/next/bit.h) \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/bitops.h \
  include/asm-generic/bitops/non-atomic.h \
  include/asm-generic/bitops/fls64.h \
  include/asm-generic/bitops/sched.h \
  include/asm-generic/bitops/hweight.h \
  include/asm-generic/bitops/lock.h \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/thread_info.h \
    $(wildcard include/config/arm/thumbee.h) \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/fpstate.h \
    $(wildcard include/config/vfpv3.h) \
    $(wildcard include/config/iwmmxt.h) \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/domain.h \
    $(wildcard include/config/verify/permission/fault.h) \
    $(wildcard include/config/io/36.h) \
  include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/spinlock/sleep.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
    $(wildcard include/config/ring/buffer.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
  /home/austrie/myandroid/prebuilt/linux-x86/toolchain/arm-eabi-4.4.0/bin/../lib/gcc/arm-eabi/4.4.0/include/stdarg.h \
  include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  include/linux/ratelimit.h \
  include/linux/param.h \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/param.h \
    $(wildcard include/config/hz.h) \
  include/linux/dynamic_debug.h \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/byteorder.h \
  include/linux/byteorder/little_endian.h \
  include/linux/swab.h \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/swab.h \
  include/linux/byteorder/generic.h \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/debug/bugverbose.h) \
  include/asm-generic/bug.h \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/div64.h \
  include/linux/stringify.h \
  include/linux/bottom_half.h \
  include/linux/spinlock_types.h \
  include/linux/spinlock_types_up.h \
  include/linux/lockdep.h \
    $(wildcard include/config/lock/stat.h) \
    $(wildcard include/config/generic/hardirqs.h) \
  include/linux/spinlock_up.h \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/atomic.h \
  include/asm-generic/atomic-long.h \
  include/linux/spinlock_api_up.h \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/current.h \
  include/linux/kdev_t.h \
  include/linux/dcache.h \
  include/linux/rculist.h \
  include/linux/rcupdate.h \
    $(wildcard include/config/tree/preempt/rcu.h) \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/tree/rcu.h) \
  include/linux/rcu_types.h \
  include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
    $(wildcard include/config/disable/obsolete/cpumask/functions.h) \
  include/linux/bitmap.h \
  include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/string.h \
  include/linux/seqlock.h \
  include/linux/completion.h \
  include/linux/rcutiny.h \
    $(wildcard include/config/no/hz.h) \
  include/linux/path.h \
  include/linux/stat.h \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/stat.h \
  include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
  include/linux/math64.h \
  include/linux/kobject.h \
    $(wildcard include/config/hotplug.h) \
  include/linux/sysfs.h \
  include/linux/errno.h \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/errno.h \
  include/asm-generic/errno.h \
  include/asm-generic/errno-base.h \
  include/linux/kref.h \
  include/linux/radix-tree.h \
  include/linux/prio_tree.h \
  include/linux/init.h \
    $(wildcard include/config/modules.h) \
  include/linux/pid.h \
  include/linux/mutex.h \
    $(wildcard include/config/debug/mutexes.h) \
  include/linux/capability.h \
    $(wildcard include/config/security/file/capabilities.h) \
  include/linux/semaphore.h \
  include/linux/fiemap.h \
  include/linux/quota.h \
  include/linux/rwsem.h \
    $(wildcard include/config/rwsem/generic/spinlock.h) \
  include/linux/rwsem-spinlock.h \
  include/linux/dqblk_xfs.h \
  include/linux/dqblk_v1.h \
  include/linux/dqblk_v2.h \
  include/linux/dqblk_qtree.h \
  include/linux/nfs_fs_i.h \
  include/linux/nfs.h \
  include/linux/sunrpc/msg_prot.h \
  include/linux/inet.h \
  include/linux/fcntl.h \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/fcntl.h \
  include/asm-generic/fcntl.h \
  include/linux/err.h \
  include/linux/uaccess.h \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/uaccess.h \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/memory.h \
    $(wildcard include/config/page/offset.h) \
    $(wildcard include/config/thumb2/kernel.h) \
    $(wildcard include/config/highmem.h) \
    $(wildcard include/config/dram/size.h) \
    $(wildcard include/config/dram/base.h) \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/discontigmem.h) \
  include/linux/const.h \
  arch/arm/mach-msm/include/mach/memory.h \
    $(wildcard include/config/phys/offset.h) \
    $(wildcard include/config/arch/msm/arm11.h) \
    $(wildcard include/config/cache/l2x0.h) \
    $(wildcard include/config/arch/msm/scorpion.h) \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/sizes.h \
  include/asm-generic/memory_model.h \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
    $(wildcard include/config/sparsemem.h) \
  /home/austrie/.Triumph_Kernel_sources/mykernel/arch/arm/include/asm/unified.h \
    $(wildcard include/config/arm/asm/unified.h) \
  include/linux/msm_audio.h \
  arch/arm/mach-msm/include/mach/qdsp5v2/qdsp5audppmsg.h \
  arch/arm/mach-msm/include/mach/qdsp5v2/qdsp5audplaycmdi.h \
  arch/arm/mach-msm/include/mach/qdsp5v2/qdsp5audplaymsg.h \
  arch/arm/mach-msm/include/mach/qdsp5v2/audpp.h \
  arch/arm/mach-msm/include/mach/qdsp5v2/qdsp5audppcmdi.h \
    $(wildcard include/config/cmd/v.h) \
    $(wildcard include/config/common/len.h) \
    $(wildcard include/config/env/104/len.h) \
    $(wildcard include/config/env/15/len.h) \
  arch/arm/mach-msm/include/mach/qdsp5v2/codec_utils.h \
    $(wildcard include/config/has/earlysuspend.h) \
    $(wildcard include/config/debug/fs.h) \
  include/linux/earlysuspend.h \
  arch/arm/mach-msm/include/mach/qdsp5v2/mp3_funcs.h \
  arch/arm/mach-msm/include/mach/debug_mm.h \

arch/arm/mach-msm/qdsp5v2/mp3_funcs.o: $(deps_arch/arm/mach-msm/qdsp5v2/mp3_funcs.o)

$(deps_arch/arm/mach-msm/qdsp5v2/mp3_funcs.o):
