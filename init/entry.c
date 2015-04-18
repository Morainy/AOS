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
	
	init_timer(2000);

	//开启中断
	asm volatile ("sti");
	//asm volatile ("int $0x20");

	//asm volatile("int $0x8");
	//asm volatile("int $0xD");
	return 0;
}
