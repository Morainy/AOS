/*
 * =====================================================================================
 *
 *       Filename:  multiboot.h
 *
 *    Description:  multiboot_t 结构体描述
 *
 *        Version:  1.0
 *        Created:  2015年04月16日 10时03分45秒
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Morain
 *   Organization:  
 *
 * =====================================================================================
 */

#ifndef INCLUDE_MULTIBOOT_H_
#define INCLUDE_MULTIBOOT_H_

#include "types.h"

typedef
struct multiboot_t{
	uint32_t flags ; //Multiboot 的版本信息
	/* *
	 *从BIOS 获知的可用内存
	 *mem_lower和mem_upper分别指出了低端和高端内存的大小，单位是KB
	 *低端内存的首地址是0 ， 高端内存的首地址是1M
	 *低端内存的最大可能是640K
	 *高端内存的最大可能值是最大值减去1M  但并不保证是这个值
	 * */
	uint32_t mem_lower;
	uint32_t mem_upper;

	uint32_t boot_device;   //指出引导程序从哪个磁盘设备载入的映像BIOSOS
	uint32_t cmdline;		//内核命令行
	uint32_t mods_count;	//boot 模块列表
	uint32_t mods_addr;

	/**
	 *ELF格式内核映像的section头表。包括每项的大小、一共有几项以及
	 *作为名字索引的字符串
	 * */
	uint32_t num;
	uint32_t size;
	uint32_t addr;
	uint32_t shndx;

	/* *
	 *以下两项指出保存由BIOS提供的内存分布的缓冲区的地址和长度
	 *mmap_addr是缓冲区的地址，mmap_length是缓冲区的大小
	 *缓冲区由一个或者多个下面的mmap_entry_t 组成
	 * */
	uint32_t mmap_length;
	uint32_t mmap_addr;

	uint32_t drives_length;			//指出第一个驱动器结构的大小
	uint32_t drives_addr;			//指出第一个驱动器结构的物理地址
	uint32_t config_table;			//ROM配置表
	uint32_t boot_loader_name;		//boot loader的名字
	uint32_t apm_table;				//APM表
	uint32_t vbe_control_info;
	uint32_t vbe_mode_info;
	uint32_t vbe_mode;
	uint32_t vbe_interface_seg;
	uint32_t vbe_interface_off;
	uint32_t vbe_interface_len;
}__attribute__((packed)) multiboot_t;

/* *
 *size是相关结构的大小，单位是字节，它可能大于最小值20
 *base_addr_low是启动地址的低位，base_addr_high 是高32位，启动地址共64位
 *length_low 是内存区域大小的低位，length_high是内存区域大小的高32位，共64位
 *type是相应地址空间的类型，1代表可用，所有其它的值代表保留区域RAM
 * */
typedef
struct mmap_entry_t{
	uint32_t size;			//size 是不含size自身变量的大小
	uint32_t base_addr_low;
	uint32_t base_addr_high;
	uint32_t length_low;
	uint32_t length_high;
	uint32_t type;
}__attribute__((packed)) mmap_entry_t;

//声明全局的multiboot_t * 指针
//内核未建立分页机制前暂存的指针
extern multiboot_t *mboot_ptr_tmp;

//内核页表建立后的指针
extern multiboot_t * glb_mboot_ptr;

#endif
