/*
 * =====================================================================================
 *
 *       Filename:  elf.h
 *
 *    Description:  可执行文件格式
 *
 *        Version:  1.0
 *        Created:  2015年04月16日 10时50分06秒
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  morain
 *   Organization:  
 *
 * =====================================================================================
 */
#ifndef INCLUDE_ELF_H_
#define INCLUDE_ELF_H_

#include "types.h"
#include "multiboot.h"

#define ELF32_ST_TYPE(i) ((i)&0xF)

//ELF格式区段头
typedef
struct elf_section_header_t{
	uint32_t name;
	uint32_t type;
	uint32_t flags;
	uint32_t addr;
	uint32_t offset;
	uint32_t size;
	uint32_t link;
	uint32_t info;
	uint32_t addralign;
	uint32_t entsize;
}__attribute__((packed)) elf_section_header_t;

//ELF格式符号
typedef
struct elf_symbol_t{
	uint32_t name;
	uint32_t value;
	uint32_t size;
	uint32_t info;
	uint32_t other;
	uint32_t shndx;
}__attribute__((packed)) elf_symbol_t;

//ELF 信息
typedef
struct elf_t{
	elf_symbol_t * symtab;
	uint32_t symtabsz;
	const char * strtab;
	uint32_t strtabsz;
}elf_t;

//从multiboot_t 结构获取elf信息
elf_t elf_from_multiboot(multiboot_t *mb);

//查看elf符号信息
const char * elf_lookup_symbol(uint32_t addr , elf_t *elf);

#endif

