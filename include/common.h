/*
 * =====================================================================================
 *
 *       Filename:  common.h
 *
 *    Description:  端口读写函数头
 *
 *        Version:  1.0
 *        Created:  2015年04月16日 08时09分31秒
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */
#ifndef INCLUDE_COMMON_H_
#define INCLUDE_COMMON_H_

#include "types.h"

//端口写一个字节
void outb(uint16_t port , uint8_t val);

//端口读一个字节
uint8_t inb(uint16_t port);

//端口读一个字
uint16_t inw(uint16_t port);

#endif
