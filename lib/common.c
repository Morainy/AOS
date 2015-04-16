/*
 * =====================================================================================
 *
 *       Filename:  common.c
 *
 *    Description:  端口读写函数的实现
 *
 *        Version:  1.0
 *        Created:  2015年04月16日 08时13分41秒
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Morain
 *   Organization:  
 *
 * =====================================================================================
 */
#include "common.h"

//端口写一个字节
inline void outb(uint16_t port , uint8_t val)
{
	asm volatile ("outb %1, %0" : : "dN" (port) , "a" (val));
}

//端口读一个字节
inline uint8_t inb(uint16_t port)
{
	uint8_t ret;
	asm volatile ("inb %1 , %0" : "=a"(ret) : "dN"(port));
	return ret;
}

//端口读一个字
inline uint16_t inw(uint16_t port)
{
	uint16_t ret;
	asm volatile ("inw %1 , %0" :"=a"(ret) : "dN"(port));
	return ret;
}
