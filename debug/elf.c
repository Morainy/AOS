/*
 * =====================================================================================
 *
 *       Filename:  elf.c
 *
 *    Description:  从multiboot_t 结构体中获取elf信息的函数实现
 *
 *        Version:  1.0
 *        Created:  2015年04月16日 11时02分51秒
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Morain
 *   Organization:  
 *
 * =====================================================================================
 */
#include "elf.h"
#include "common.h"
#include "string.h"

//从 multiboot_t 结构体获取elf信息

elf_t elf_from_multiboot(multiboot_t *mb)
{
	int i;
	elf_t elf;
	elf_section_header_t *sh = (elf_section_header_t *)mb->addr;

	uint32_t shstrtab = sh[mb->shndx].addr;
	for(i = 0 ; i < mb->num ; i++){
		const char * name = (const char * )(shstrtab + sh[i].name);
		//在GRUB 提供的multiboot 信息中寻找
		//内核ELF格式所提取的字符串表和符号表
		if(strcmp(name , ".strtab") == 0){
			elf.strtab = (const char *)sh[i].addr;
			elf.strtabsz = sh[i].size;
		}
		if(strcmp(name , ".symtab") == 0){
			elf.symtab = (elf_symbol_t*)sh[i].addr;
			elf.symtabsz = sh[i].size;
		}
	}
	return elf;
}
//查看elf的符号信息
const char * elf_lookup_symbol(uint32_t addr , elf_t *elf)
{
	int i;
	for(i = 0 ; i < (elf->symtabsz / sizeof(elf_symbol_t)) ; i++){
		if(ELF32_ST_TYPE(elf->symtab[i].info) != 0x2){
			continue;
		}
		if( (addr >= elf->symtab[i].value) && (addr < (elf->symtab[i].value + elf->symtab[i].size))){
			return (const char * )((uint32_t )elf->strtab + elf->symtab[i].name);
		}
	}
	return NULL;
}