/*
 * =====================================================================================
 *
 *       Filename:  entry.c
 *
 *    Description:  入口函数
 *
 *        Version:  1.0
 *        Created:  2015年04月15日 16时16分42秒
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */
#include "console.h"
#include "gdt.h"
#include "debug.h"
#include "idt.h"
#include "timer.h"
#include "pmm.h"
#include "vmm.h"


//内核初始化函数
void kern_init();

//开启分页机制之后的multiboot数据指针
multiboot_t * glb_mboot_ptr;

//开启分页机制之后的内核栈
char kern_stack[STACK_SIZE];

//内核使用的临时页表和页目录
//该地址必须是页对齐的地址，内存0-640KB肯定是空闲的
__attribute__((section(".init.data"))) pgd_t *pgd_tmp = (pgd_t *)0x1000;
__attribute__((section(".init.data"))) pgd_t *pte_low = (pgd_t *)0x2000;
__attribute__((section(".init.data"))) pgd_t *pte_hign = (pgd_t *)0x3000;

//内核入口函数
__attribute__((section(".init.text"))) void kern_entry()
{
	pgd_tmp[0] = (uint32_t)pte_low | PAGE_PRESENT | PAGE_WRITE;
	pgd_tmp[PGD_INDEX(PAGE_OFFSET)] = (uint32_t)pte_hign | PAGE_PRESENT | PAGE_WRITE;

	//映射内核虚拟地址4MB到物理地址的前4MB
	int i;
	for(i = 0 ; i < 1024 ; i++){
		pte_low[i] = (i << 12) | PAGE_PRESENT | PAGE_WRITE;
	}
	//映射0x00000000 - 0x00400000 的物理地址到虚拟地址0xC0000000 - 0xC0400000
	for(i = 0 ; i <1024 ; i++){
		pte_hign[i] = (i << 12) | PAGE_PRESENT | PAGE_WRITE;
	}
	
	//设置临时页表
	asm volatile ("mov %0 , %%cr3" :: "r"(pgd_tmp));

	uint32_t cr0;

	//启用分页机制，将cr0寄存器的值置为1
	asm volatile ("mov %%cr0 , %0": "=r" (cr0));
	cr0 |= 0x80000000;
	asm volatile ("mov %0, %%cr0"::"r"(cr0));

	//切换内核栈
	uint32_t kern_stack_top = ((uint32_t)kern_stack + STACK_SIZE ) & 0xFFFFFFF0;

	asm volatile ("mov %0, %%esp\n\t"
					"xor %%ebp, %%ebp"::"r"(kern_stack_top));

	//更新全局multiboot 指针
	glb_mboot_ptr = mboot_ptr_tmp + PAGE_OFFSET;
	
	//调用内核初始化函数
	kern_init();
}

void kern_init()
{
	init_debug();
	init_gdt();
	init_idt();
	console_clear();
	//char str1[] = "Hello, OS Kernel";
	//char str2[] = "Hello, Morain Kernel";
	printk_color(rc_black , rc_green , "Hello, OS kernel!\n");
	//printk("str2 = %s\n",str2);
	
	//printk("strcmp(str1 , str2) = %d\n",strcmp(str1 , str2));
	//print_cur_status();
	//panic("test");

	//print_cur_status();

	//asm volatile ("int $0x3");
	//asm volatile ("int $0x4");
	
	init_timer(200);

	//开启中断
	//asm volatile ("sti");
	//asm volatile ("int $0x20");

	//asm volatile("int $0x8");
	//asm volatile("int $0xD");
	
	printk("kernel in memory start:0x%08X\n", kern_start);
	printk("kernel in memory end:0x%08X\n", kern_end);
	printk("kernel in memory used:%dKB\n\n", (kern_end - kern_start + 1023)/1024);

	show_memory_map();

	init_pmm();

    printk_color(rc_black, rc_red, "\nThe Count of Physical Memory Page is: %u\n\n", phy_page_count);

    uint32_t allc_addr = NULL;
    printk_color(rc_black, rc_light_brown, "Test Physical Memory Alloc :\n");
    allc_addr = pmm_alloc_page();
    printk_color(rc_black, rc_light_brown, "Alloc Physical Addr: 0x%08X\n", allc_addr);
    allc_addr = pmm_alloc_page();
    printk_color(rc_black, rc_light_brown, "Alloc Physical Addr: 0x%08X\n", allc_addr);
    allc_addr = pmm_alloc_page();
    printk_color(rc_black, rc_light_brown, "Alloc Physical Addr: 0x%08X\n", allc_addr);
    allc_addr = pmm_alloc_page();
    printk_color(rc_black, rc_light_brown, "Alloc Physical Addr: 0x%08X\n", allc_addr);


	while(1){
		asm volatile ("hlt");
	}
	
}
