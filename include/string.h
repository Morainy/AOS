/*
 * =====================================================================================
 *
 *       Filename:  string.h
 *
 *    Description:  字符串处理函数声明
 *
 *        Version:  1.0
 *        Created:  2015年04月16日 08时53分18秒
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */

#ifndef INCLUDE_STRING_H_
#define INCLUDE_STRING_H_

#include "types.h"

void memcpy(uint8_t * dest , const uint8_t * src , uint32_t len);

void memset(void * dest , uint8_t val , uint32_t len);

void bzero(void * dest , uint32_t len);

int strcmp(const char * str1 , const char * str2);

char *strcpy(char * dest , const char * src);

char * strcat(char * dest , const char * src);

int strlen(const char * src);

#endif
