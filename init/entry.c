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
#include "string.h"
#include "debug.h"

int kern_entry()
{
	init_debug();
	console_clear();
	char str[] = "Hello, OS Kernel";
	printk_color(rc_black , rc_green , "%s\n" , str);
	//panic("test");

	print_cur_status();

	return 0;
}
