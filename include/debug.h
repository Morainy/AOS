/*
 * =====================================================================================
 *
 *       Filename:  debug.h
 *
 *    Description:  调试中的打印函数
 *
 *        Version:  1.0
 *        Created:  2015年04月16日 09时32分30秒
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */
#ifndef INCLUDE_DEBUG_H_
#define INCLUDE_DEBUG_H_

#include "console.h"
#include "vargs.h"
#include "elf.h"

#define assert(x , info)				\
		do{								\
			if(!(x)){					\
				panic(info);			\
			}							\
		}while(0)

//编译期间静态检测
#define static_assert(x)				\
		switch(x){case 0: case(x): ;}

//初始化Debug信息
void init_debug();

//打印当前的函数调用栈信息
void panic(const char * msg);

//打印当前的段寄存器
void print_cur_status();

//内核的打印函数
void printk(const char * format, ...);

//内核的带颜色的打印函数
void printk_color(real_color_t back , real_color_t fore , const char * format, ...);

#endif
