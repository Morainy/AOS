/*
 * =====================================================================================
 *
 *       Filename:  string.c
 *
 *    Description:  字符串处理函数的实现
 *
 *        Version:  1.0
 *        Created:  2015年04月16日 08时59分16秒
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */
#include "string.h"

inline void memcpy(uint8_t *dest , const uint8_t * src , uint32_t len)
{
	int i;
	for (i = 0 ; i <len; i++){
		*dest++ = *src++;
	}
}

inline void memset(void * dest , uint8_t val , uint32_t len)
{
	uint8_t * dst = dest;
	while(len > 0){
		*dst++ = val;
		len--;
	}
}
inline void bzero(void * dest , uint32_t len)
{
	memset(dest , 0 , len);
}

int strcmp(const char * str1 , const char * str2)
{
	int i = 0;
	while(str1[i] || str2[i]){
		if(str1[i] > str2[i]){
			return 1;
		}
		else if(str1[i] <str2[i]){
			return -1;
		}
		i++;
	}
	return 0;
}
inline char * strcpy(char * dest , const char * src)
{
	char * ptr = dest;
	while(*src){
		*ptr++ = *src++;
	}
	*ptr = '\0';
	return dest;
}

inline char * strcat(char * dest , const char * src)
{
	char * ptr = dest;
	while(*ptr){
		ptr++;
	}
	while(*src){
		*ptr++ = *src++;
	}
	*ptr = '\0';
	return dest;
}

int strlen(const char * src)
{
	int res = 0;
	while(*src++){
		res++;
	}
	return res;
}
