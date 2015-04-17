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
#include "string.h"
#include "debug.h"

int kern_entry()
{
	init_debug();
	init_gdt();
	console_clear();
	//char str1[] = "Hello, OS Kernel";
	//char str2[] = "Hello, Morain Kernel";
	printk_color(rc_black , rc_green , "Hello, OS kernel!\n");
	//printk("str2 = %s\n",str2);
	
	//printk("strcmp(str1 , str2) = %d\n",strcmp(str1 , str2));
	//print_cur_status();
	panic("test");

	//print_cur_status();

	return 0;
}
