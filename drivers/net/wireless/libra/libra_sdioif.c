/* Copyright (c) 2009, Code Aurora Forum. All rights reserved.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 and
 * only version 2 as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301, USA.
 *
 */

#include <linux/libra_sdioif.h>
#include <linux/delay.h>
#include <linux/mmc/sdio.h>
#include <linux/mmc/mmc.h>
#include <linux/mmc/host.h>
#include <linux/mmc/card.h>


/* Libra SDIO function device */
static struct sdio_func *libra_sdio_func;
static struct mmc_host *libra_mmc_host;
static int libra_mmc_host_index;

suspend_handler_t* libra_suspend_hldr = NULL;
resume_handler_t*  libra_resume_hldr = NULL;

extern	int	libra_loaded;

/**
 * libra_sdio_configure() - Function to configure the SDIO device param
 * @libra_sdio_rxhandler    Rx handler
 * @func_drv_fn             Function driver function for special setup
 * @funcdrv_timeout         Function Enable timeout
 * @blksize                 Block size
 *
 * Configure SDIO device, enable function and set block size
 */
int libra_sdio_configure(sdio_irq_handler_t libra_sdio_rxhandler,
	void  (*func_drv_fn)(int *status),
	unsigned int funcdrv_timeout, unsigned int blksize)
{
	int err_ret = 0;
	struct sdio_func *func = libra_sdio_func;

	if (libra_sdio_func == NULL) {
		printk(KERN_ERR "%s: Error SDIO card not detected\n", __func__);
		goto cfg_error;
	}

	sdio_claim_host(func);

	/* Currently block sizes are set here. */
	func->max_blksize = blksize;
	if (sdio_set_block_size(func, blksize)) {
		printk(KERN_ERR "%s: Unable to set the block size.\n",
				__func__);
		sdio_release_host(func);
		goto cfg_error;
	}

	/* Function driver specific configuration. */
	if (func_drv_fn) {
		(*func_drv_fn)(&err_ret);
		if (err_ret) {
			printk(KERN_ERR "%s: function driver provided configure function error=%d\n",
				__func__, err_ret);
			sdio_release_host(func);
			goto cfg_error;
		}
	}

	/* We set this based on the function card. */
	func->enable_timeout = funcdrv_timeout;
	err_ret = sdio_enable_func(func);
	if (err_ret != 0) {
		printk(KERN_ERR "%s: Unable to enable function %d\n",
				__func__, err_ret);
		sdio_release_host(func);
		goto cfg_error;
	}

	if (sdio_claim_irq(func, libra_sdio_rxhandler)) {
		sdio_disable_func(func);
		printk(KERN_ERR "%s: Unable to claim irq.\n", __func__);
		sdio_release_host(func);
		goto cfg_error;
	}

	sdio_release_host(func);

	return 0;

cfg_error:
	return -1;

}
EXPORT_SYMBOL(libra_sdio_configure);

int libra_sdio_configure_suspend_resume(suspend_handler_t* libra_sdio_suspend_hdlr, 
                                        resume_handler_t* libra_sdio_resume_hdlr)
{
	libra_suspend_hldr = libra_sdio_suspend_hdlr;
	libra_resume_hldr = libra_sdio_resume_hdlr;
	return 0;
}
EXPORT_SYMBOL(libra_sdio_configure_suspend_resume);

/*
 * libra_sdio_deconfigure() - Function to reset the SDIO device param
 */
void libra_sdio_deconfigure(struct sdio_func *func)
{
  	if(NULL == libra_sdio_func)
		return;

	sdio_claim_host(func);
	sdio_release_irq(func);
	sdio_disable_func(func);
	sdio_release_host(func);
}
EXPORT_SYMBOL(libra_sdio_deconfigure);

/*
 * Return the SDIO Function device
 */
struct sdio_func *libra_getsdio_funcdev(void)
{
	return libra_sdio_func;
}
EXPORT_SYMBOL(libra_getsdio_funcdev);

/*
 * Set function driver as the private data for the function device
 */
void libra_sdio_setprivdata(struct sdio_func *sdio_func_dev,
		void *padapter)
{
    if(NULL == libra_sdio_func)
		   return;
    
	  sdio_set_drvdata(sdio_func_dev, padapter);
}
EXPORT_SYMBOL(libra_sdio_setprivdata);

/*
 * Return private data of the function device.
 */
void *libra_sdio_getprivdata(struct sdio_func *sdio_func_dev)
{
	return sdio_get_drvdata(sdio_func_dev);
}
EXPORT_SYMBOL(libra_sdio_getprivdata);

// give the libra module a fixed mac address
//unsigned long long proc_comm_ftm_wlanaddr_read(void) {
//	return 0xAF5026341ull;
//}
// EXPORT_SYMBOL(proc_comm_ftm_wlanaddr_read);

/*
 * Function driver claims the SDIO device
 */
void libra_claim_host(struct sdio_func *sdio_func_dev,
		pid_t *curr_claimed, pid_t current_pid, atomic_t *claim_count)
{
  if(NULL == libra_sdio_func)
		  return;
  
	 if (*curr_claimed == current_pid) {
		 atomic_inc(claim_count);
		return;
	}

	/* Go ahead and claim the host if not locked by anybody. */
	sdio_claim_host(sdio_func_dev);

	*curr_claimed = current_pid;
	atomic_inc(claim_count);

}
EXPORT_SYMBOL(libra_claim_host);

/*
 * Function driver releases the SDIO device
 */
void libra_release_host(struct sdio_func *sdio_func_dev,
		pid_t *curr_claimed, pid_t current_pid, atomic_t *claim_count)
{

  if(NULL == libra_sdio_func)
		  return;
  
	if (*curr_claimed != current_pid) {
		/* Dont release  */
		return;
	}

	atomic_dec(claim_count);
	if (atomic_read(claim_count) == 0) {
		*curr_claimed = 0;
		sdio_release_host(sdio_func_dev);
	}
}
EXPORT_SYMBOL(libra_release_host);

void libra_sdiocmd52(struct sdio_func *sdio_func_dev, unsigned int addr,
	u8 *byte_var, int write, int *err_ret)
{
	if (write)
		sdio_writeb(sdio_func_dev, byte_var[0], addr, err_ret);
	else
		byte_var[0] = sdio_readb(sdio_func_dev, addr, err_ret);
}
EXPORT_SYMBOL(libra_sdiocmd52);

u8 libra_sdio_readsb(struct sdio_func *func, void *dst,
	unsigned int addr, int count)
{
	return sdio_readsb(func, dst, addr, count);
}
EXPORT_SYMBOL(libra_sdio_readsb);

int libra_sdio_memcpy_fromio(struct sdio_func *func,
		void *dst, unsigned int addr, int count)
{
	return sdio_memcpy_fromio(func, dst, addr, count);
}
EXPORT_SYMBOL(libra_sdio_memcpy_fromio);

int libra_sdio_writesb(struct sdio_func *func,
		unsigned int addr, void *src, int count)
{
	return sdio_writesb(func, addr, src, count);
}
EXPORT_SYMBOL(libra_sdio_writesb);

int libra_sdio_memcpy_toio(struct sdio_func *func,
	unsigned int addr, void *src, int count)
{
	return sdio_memcpy_toio(func, addr, src, count);
}
EXPORT_SYMBOL(libra_sdio_memcpy_toio);

int libra_enable_sdio_irq(struct sdio_func *func, u8 enable)
{
 
	if (libra_mmc_host) {
		if (!enable) {
	 		/*Disable SDIO IRQ */
 			libra_mmc_host->ops->enable_sdio_irq(libra_mmc_host, 0);

      			/*SDIO IRQ thread can re-enable the interrupt  if card capability 
			  is set as MMC_CAP_SDIO_IRQ. So disable that as well */
      			libra_mmc_host->caps &= ~MMC_CAP_SDIO_IRQ;			
		}
		else {
 			libra_mmc_host->ops->enable_sdio_irq(libra_mmc_host, 1);
 			libra_mmc_host->caps |= MMC_CAP_SDIO_IRQ;				
		}
		return 0;
	}

	printk(KERN_ERR "%s: Could not enable disable irq \n", __func__);
	return -1;
}
EXPORT_SYMBOL(libra_enable_sdio_irq);

int libra_detect_card_change(void)
{
 
	if (libra_mmc_host) {
		if (!strcmp(libra_mmc_host->class_dev.class->name, "mmc_host")
			&& (libra_mmc_host_index == libra_mmc_host->index)) {
			mmc_detect_change(libra_mmc_host, 0);
			return 0;
		}
	}

	printk(KERN_ERR "%s: Could not trigger card change \n", __func__);
	return -1;
}
EXPORT_SYMBOL(libra_detect_card_change);
int libra_sdio_enable_polling(void)
{
	if (libra_mmc_host) {
		if (!strcmp(libra_mmc_host->class_dev.class->name, "mmc_host")
			&& (libra_mmc_host_index == libra_mmc_host->index)) {
			libra_mmc_host->caps |= MMC_CAP_NEEDS_POLL;
			mmc_detect_change(libra_mmc_host, 0);
			return 0;
		}
	}

	printk(KERN_ERR "%s: Could not trigger SDIO scan\n", __func__);
	return -1;
}
EXPORT_SYMBOL(libra_sdio_enable_polling);

void libra_sdio_set_clock(struct sdio_func *func, unsigned int clk_freq)
{
    struct mmc_host *host = func->card->host;
    host->ios.clock = clk_freq;
    host->ops->set_ios(host, &host->ios);

}
EXPORT_SYMBOL(libra_sdio_set_clock);

/*
 * SDIO Probe
 */
static int libra_sdio_probe(struct sdio_func *func,
		const struct sdio_device_id *sdio_dev_id)
{
	libra_mmc_host = func->card->host;
	libra_mmc_host_index = libra_mmc_host->index;
	libra_sdio_func = func;

	/* Enable IRQ CAP */
	libra_mmc_host->caps |= MMC_CAP_SDIO_IRQ; 

	printk(KERN_INFO "%s: success with block size of %d caps %ld\n",
		__func__, func->cur_blksize, func->card->host->caps );

	/* Turn off SDIO polling from now on */
	libra_mmc_host->caps &= ~MMC_CAP_NEEDS_POLL;	
	
	return 0;
}

static void libra_sdio_remove(struct sdio_func *func)
{
	libra_sdio_func = NULL;
	
	printk(KERN_INFO "%s : Module removed.\n", __func__);
}

int libra_sdio_suspend (struct device *dev)
{
	struct sdio_func *func = dev_to_sdio_func(dev);
        int ret = 0;

	mmc_pm_flag_t flags = sdio_get_host_pm_caps(func);

        printk("%s Called, func %p, flags 0x%x\n",__func__, func, flags);
       
	ret = sdio_set_host_pm_flags(func, MMC_PM_KEEP_POWER);
	if (ret)
		return ret;

	if(libra_suspend_hldr)
	{
		unsigned int attempts = 0;
		/* Disable SDIO IRQ when driver is being suspended */
		do {
			libra_enable_sdio_irq(func, 0);
			ret = libra_suspend_hldr(func);
			if (ret) {
				printk(KERN_ERR "%s: Libra driver is not able to suspend\n" , __func__);
				/* Error - Restore SDIO IRQ */
				libra_enable_sdio_irq(func, 1);		
				msleep(10);
			}
		} while(ret && ++attempts<5);
		if (ret)
			return ret;
	}
	return sdio_set_host_pm_flags(func, MMC_PM_WAKE_SDIO_IRQ);
}

int libra_sdio_resume(struct device *dev)
{
	struct sdio_func *func = dev_to_sdio_func(dev);
        printk("%s Called, func %p\n",__func__, func);

	if(libra_resume_hldr)
	{
		libra_resume_hldr(func);
		/* Restore SDIO IRQ */
		libra_enable_sdio_irq(func, 1);				
	}
        return 0;
}


static struct sdio_device_id libra_sdioid[] = {
    {.class = 0, .vendor = LIBRA_MAN_ID, .device = 0},
    {}
};

static struct dev_pm_ops libra_sdio_pm_ops = {
    .suspend = libra_sdio_suspend,
    .resume = libra_sdio_resume,
};

static struct sdio_driver libra_sdiofn_driver = {
    .name      = "libra_sdiofn",
    .id_table  = libra_sdioid,
    .probe     = libra_sdio_probe,
    .remove    = libra_sdio_remove,
    .drv.pm    = &libra_sdio_pm_ops,
};

static int __init libra_sdioif_init(void)
{
	libra_sdio_func = NULL;
	libra_mmc_host = NULL;
	libra_mmc_host_index = -1;

	libra_loaded = 1;

	sdio_register_driver(&libra_sdiofn_driver);

	printk(KERN_INFO "%s: Loaded Successfully\n", __func__);

	return 0;
}

static void __exit libra_sdioif_exit(void)
{
	unsigned int attempts = 0;

	if (!libra_detect_card_change()) {
		do {
			++attempts;
			msleep(500);
		} while (libra_sdio_func != NULL && attempts < 3);
	}

	if (libra_sdio_func != NULL)
		printk(KERN_ERR "%s: Card removal not detected\n", __func__);

	sdio_unregister_driver(&libra_sdiofn_driver);

	libra_sdio_func = NULL;
	libra_mmc_host = NULL;
	libra_mmc_host_index = -1;

	printk(KERN_INFO "%s: Unloaded Successfully, load flag was %d\n", __func__, libra_loaded);
	libra_loaded = 0;
}

module_init(libra_sdioif_init);
module_exit(libra_sdioif_exit);

MODULE_LICENSE("GPL v2");
MODULE_VERSION("1.0");
MODULE_DESCRIPTION("WLAN SDIODriver");
