/*
 * =====================================================================================
 *
 *       Filename:  vmm.h
 *
 *    Description:  虚拟页表机制
 *
 *        Version:  1.0
 *        Created:  2015年04月19日 10时04分50秒
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Morain 
 *   Organization:  
 *
 * =====================================================================================
 */

#ifndef INCLUDE_VMM_H_
#define INCLUDE_VMM_H_

#include "types.h"
#include "idt.h"
#include "pmm.h"

//内核的偏移地址
#define PAGE_OFFSET		0xC0000000

/* *
 *P-- 位0是存在（Present）标志，用于指明表项堆地址转换是否有效
 *P = 1 表示有效； P = 0 表示无效
 *在页转换过程中，如果涉及的页目录或页表的表项无效，则引发一个异常
 *如果P = 0 ， 那么除表示表项无效外，其余位可供程序自由使用
 *例如，操作系统可以使用这些位来保存已存储在磁盘上的页面的序号
 * */
#define PAGE_PRESENT 0x1

/* *
 *R/W--位1是读/写（Read/Write)标志。如果等于1，表示页面可以被读、写或执行。
 *如果为0 ， 表示页面只读或可执行
 *当处理器运行在超级用户特权级（级别0，1或）2时，则R/W位不起作用
 *页目录项中的R/W位对其所映射的所有页面起作用
 * */
#define PAGE_WRITE 0x2

/* *
 *U/S --- 位  2 是用户/超级用户(User/Supervisor)标志
 *如果为1，那么运行在任何特权级上的程序都可以访问该页面
 *如果为0，那么页面只能被运行在超级用户特权级（0，1或2）上的程序访问
 *页目录项中的U/S位对其所映射的所有页面起作用
 * */
#define PAGE_USER 0x4

//虚拟分页大小
#define PAGE_SIZE 4096

//页掩码，用于4KB对齐
#define PAGE_MASK 0xFFFFF000

//获取一个地址的页目录项
#define PGD_INDEX(x) (((x) >> 22) & 0x3FF)

//获取一个地址的页表项
#define PTE_INDEX(x) (((x) >> 12) & 0x3FF)

//获取一个地址的页内偏移
#define OFFSET_INDEX(x) ((x) & 0xFFF)

// 页目录数据类型
typedef uint32_t pgd_t;

//页表数据类型
typedef uint32_t pte_t;

//页目录成员数
#define PGD_SIZE (PAGE_SIZE / sizeof(pte_t))

//页表成员数
#define PTE_SIZE (PAGE_SIZE / sizeof(uint32_t))

//映射512MB内存所需要的页目录项数
#define PTE_COUNT 128

//内核页目录区域
extern pgd_t pgd_kern[PGD_SIZE];

//初始化虚拟内存管理
void init_vmm();

//更换当前的页目录
void switch_pgd(uint32_t pd);

//使用flags指出的页权限，把物理地址pa映射到虚拟地址va
void map(pgd_t *pgd_now , uint32_t va, uint32_t pa, uint32_t flags);

//取消虚拟地址va的物理映射
void unmap(pgd_t *pgd_now , uint32_t va);

//如果虚拟地址va映射到物理地址则返回1
//同时如果pa不是空指针则把物理地址写入pa参数
uint32_t get_mapping(pgd_t *pgd_now , uint32_t va, uint32_t *pa);

//页错误中断的函数处理
void page_fault(pt_regs * regs);

#endif

