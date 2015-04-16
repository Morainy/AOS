/*
 * =====================================================================================
 *
 *       Filename:  vargs.h
 *
 *    Description:  可变参数用到的宏
 *
 *        Version:  1.0
 *        Created:  2015年04月16日 09时35分52秒
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Morain
 *   Organization:  
 *
 * =====================================================================================
 */

#ifndef INCLUDE_VARGS_H_
#define INCLUDE_VARGS_H_

typedef __builtin_va_list va_list;

#define va_start(ap, last)         (__builtin_va_start(ap, last))
#define va_arg(ap, type)           (__builtin_va_arg(ap, type))
#define va_end(ap) 
#endif
