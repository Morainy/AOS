/*
 * =====================================================================================
 *
 *       Filename:  sched.h
 *
 *    Description:  任务调度策略
 *
 *        Version:  1.0
 *        Created:  2015年04月22日 16时10分08秒
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Morain 
 *   Organization:  
 *
 * =====================================================================================
 */

#ifndef INCLUDE_SCHEDULER_H_
#define INCLUDE_SCHEDULER_H_

#include "task.h"

//可调度进程链表
extern struct task_struct *running_proc_head;

//等待进程链表
extern struct task_struct *wait_proc_head;

//当前运行的任务
extern struct task_struct *current;

//初始化任务调度
void init_sched();

//任务调度
void schedule();

//任务切换准备
void change_task_to(struct task_struct *next);

//任务切换
void switch_to(struct context *prev , struct context *next);

#endif
