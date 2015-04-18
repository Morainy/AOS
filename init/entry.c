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

int kern_entry()
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
	
	return 0;
}
