
kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <start-0xc>:
  100000:	02 b0 ad 1b 03 00    	add    dh,BYTE PTR [eax+0x31bad]
  100006:	00 00                	add    BYTE PTR [eax],al
  100008:	fb                   	sti    
  100009:	4f                   	dec    edi
  10000a:	52                   	push   edx
  10000b:	e4 fa                	in     al,0xfa

0010000c <start>:
  10000c:	fa                   	cli    
  10000d:	bc 03 80 00 00       	mov    esp,0x8003
  100012:	bd 00 00 00 00       	mov    ebp,0x0
  100017:	83 e4 f0             	and    esp,0xfffffff0
  10001a:	89 1d 00 a0 10 00    	mov    DWORD PTR ds:0x10a000,ebx
  100020:	e8 03 00 00 00       	call   100028 <kern_entry>

00100025 <stop>:
  100025:	f4                   	hlt    
  100026:	eb fd                	jmp    100025 <stop>

00100028 <kern_entry>:
  100028:	55                   	push   ebp
  100029:	89 e5                	mov    ebp,esp
  10002b:	83 ec 28             	sub    esp,0x28
  10002e:	e8 b9 02 00 00       	call   1002ec <console_clear>
  100033:	c7 44 24 08 02 00 00 	mov    DWORD PTR [esp+0x8],0x2
  10003a:	00 
  10003b:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  100042:	00 
  100043:	c7 04 24 04 10 10 00 	mov    DWORD PTR [esp],0x101004
  10004a:	e8 d7 04 00 00       	call   100526 <console_write_color>
  10004f:	c7 45 f1 4d 6f 72 61 	mov    DWORD PTR [ebp-0xf],0x61726f4d
  100056:	66 c7 45 f5 69 6e    	mov    WORD PTR [ebp-0xb],0x6e69
  10005c:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
  100060:	b8 00 00 00 00       	mov    eax,0x0
  100065:	c9                   	leave  
  100066:	c3                   	ret    
	...

00100068 <outb>:
  100068:	55                   	push   ebp
  100069:	89 e5                	mov    ebp,esp
  10006b:	83 ec 08             	sub    esp,0x8
  10006e:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  100071:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100074:	66 89 55 fc          	mov    WORD PTR [ebp-0x4],dx
  100078:	88 45 f8             	mov    BYTE PTR [ebp-0x8],al
  10007b:	0f b7 55 fc          	movzx  edx,WORD PTR [ebp-0x4]
  10007f:	0f b6 45 f8          	movzx  eax,BYTE PTR [ebp-0x8]
  100083:	ee                   	out    dx,al
  100084:	c9                   	leave  
  100085:	c3                   	ret    

00100086 <inb>:
  100086:	55                   	push   ebp
  100087:	89 e5                	mov    ebp,esp
  100089:	53                   	push   ebx
  10008a:	83 ec 14             	sub    esp,0x14
  10008d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  100090:	66 89 45 e8          	mov    WORD PTR [ebp-0x18],ax
  100094:	0f b7 55 e8          	movzx  edx,WORD PTR [ebp-0x18]
  100098:	66 89 55 ea          	mov    WORD PTR [ebp-0x16],dx
  10009c:	0f b7 55 ea          	movzx  edx,WORD PTR [ebp-0x16]
  1000a0:	ec                   	in     al,dx
  1000a1:	89 c3                	mov    ebx,eax
  1000a3:	88 5d fb             	mov    BYTE PTR [ebp-0x5],bl
  1000a6:	0f b6 45 fb          	movzx  eax,BYTE PTR [ebp-0x5]
  1000aa:	83 c4 14             	add    esp,0x14
  1000ad:	5b                   	pop    ebx
  1000ae:	5d                   	pop    ebp
  1000af:	c3                   	ret    

001000b0 <inw>:
  1000b0:	55                   	push   ebp
  1000b1:	89 e5                	mov    ebp,esp
  1000b3:	53                   	push   ebx
  1000b4:	83 ec 14             	sub    esp,0x14
  1000b7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  1000ba:	66 89 45 e8          	mov    WORD PTR [ebp-0x18],ax
  1000be:	0f b7 55 e8          	movzx  edx,WORD PTR [ebp-0x18]
  1000c2:	66 89 55 ea          	mov    WORD PTR [ebp-0x16],dx
  1000c6:	0f b7 55 ea          	movzx  edx,WORD PTR [ebp-0x16]
  1000ca:	66 ed                	in     ax,dx
  1000cc:	89 c3                	mov    ebx,eax
  1000ce:	66 89 5d fa          	mov    WORD PTR [ebp-0x6],bx
  1000d2:	0f b7 45 fa          	movzx  eax,WORD PTR [ebp-0x6]
  1000d6:	83 c4 14             	add    esp,0x14
  1000d9:	5b                   	pop    ebx
  1000da:	5d                   	pop    ebp
  1000db:	c3                   	ret    

001000dc <memcpy>:
  1000dc:	55                   	push   ebp
  1000dd:	89 e5                	mov    ebp,esp
  1000df:	83 ec 10             	sub    esp,0x10
  1000e2:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  1000e9:	eb 17                	jmp    100102 <memcpy+0x26>
  1000eb:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  1000ee:	0f b6 10             	movzx  edx,BYTE PTR [eax]
  1000f1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  1000f4:	88 10                	mov    BYTE PTR [eax],dl
  1000f6:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
  1000fa:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
  1000fe:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
  100102:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  100105:	3b 45 10             	cmp    eax,DWORD PTR [ebp+0x10]
  100108:	72 e1                	jb     1000eb <memcpy+0xf>
  10010a:	c9                   	leave  
  10010b:	c3                   	ret    

0010010c <memset>:
  10010c:	55                   	push   ebp
  10010d:	89 e5                	mov    ebp,esp
  10010f:	83 ec 14             	sub    esp,0x14
  100112:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100115:	88 45 ec             	mov    BYTE PTR [ebp-0x14],al
  100118:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  10011b:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  10011e:	eb 11                	jmp    100131 <memset+0x25>
  100120:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  100123:	0f b6 55 ec          	movzx  edx,BYTE PTR [ebp-0x14]
  100127:	88 10                	mov    BYTE PTR [eax],dl
  100129:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
  10012d:	83 6d 10 01          	sub    DWORD PTR [ebp+0x10],0x1
  100131:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
  100135:	75 e9                	jne    100120 <memset+0x14>
  100137:	c9                   	leave  
  100138:	c3                   	ret    

00100139 <bzero>:
  100139:	55                   	push   ebp
  10013a:	89 e5                	mov    ebp,esp
  10013c:	83 ec 0c             	sub    esp,0xc
  10013f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100142:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  100146:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  10014d:	00 
  10014e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  100151:	89 04 24             	mov    DWORD PTR [esp],eax
  100154:	e8 b3 ff ff ff       	call   10010c <memset>
  100159:	c9                   	leave  
  10015a:	c3                   	ret    

0010015b <strcmp>:
  10015b:	55                   	push   ebp
  10015c:	89 e5                	mov    ebp,esp
  10015e:	83 ec 10             	sub    esp,0x10
  100161:	eb 3e                	jmp    1001a1 <strcmp+0x46>
  100163:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  100166:	03 45 08             	add    eax,DWORD PTR [ebp+0x8]
  100169:	0f b6 10             	movzx  edx,BYTE PTR [eax]
  10016c:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  10016f:	03 45 0c             	add    eax,DWORD PTR [ebp+0xc]
  100172:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  100175:	38 c2                	cmp    dl,al
  100177:	7e 07                	jle    100180 <strcmp+0x25>
  100179:	b8 01 00 00 00       	mov    eax,0x1
  10017e:	eb 40                	jmp    1001c0 <strcmp+0x65>
  100180:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  100183:	03 45 08             	add    eax,DWORD PTR [ebp+0x8]
  100186:	0f b6 10             	movzx  edx,BYTE PTR [eax]
  100189:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  10018c:	03 45 0c             	add    eax,DWORD PTR [ebp+0xc]
  10018f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  100192:	38 c2                	cmp    dl,al
  100194:	7d 07                	jge    10019d <strcmp+0x42>
  100196:	b8 ff ff ff ff       	mov    eax,0xffffffff
  10019b:	eb 23                	jmp    1001c0 <strcmp+0x65>
  10019d:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
  1001a1:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  1001a4:	03 45 08             	add    eax,DWORD PTR [ebp+0x8]
  1001a7:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  1001aa:	84 c0                	test   al,al
  1001ac:	75 b5                	jne    100163 <strcmp+0x8>
  1001ae:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  1001b1:	03 45 0c             	add    eax,DWORD PTR [ebp+0xc]
  1001b4:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  1001b7:	84 c0                	test   al,al
  1001b9:	75 a8                	jne    100163 <strcmp+0x8>
  1001bb:	b8 00 00 00 00       	mov    eax,0x0
  1001c0:	c9                   	leave  
  1001c1:	c3                   	ret    

001001c2 <strcpy>:
  1001c2:	55                   	push   ebp
  1001c3:	89 e5                	mov    ebp,esp
  1001c5:	83 ec 10             	sub    esp,0x10
  1001c8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  1001cb:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  1001ce:	eb 13                	jmp    1001e3 <strcpy+0x21>
  1001d0:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  1001d3:	0f b6 10             	movzx  edx,BYTE PTR [eax]
  1001d6:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  1001d9:	88 10                	mov    BYTE PTR [eax],dl
  1001db:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
  1001df:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
  1001e3:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  1001e6:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  1001e9:	84 c0                	test   al,al
  1001eb:	75 e3                	jne    1001d0 <strcpy+0xe>
  1001ed:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  1001f0:	c6 00 00             	mov    BYTE PTR [eax],0x0
  1001f3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  1001f6:	c9                   	leave  
  1001f7:	c3                   	ret    

001001f8 <strcat>:
  1001f8:	55                   	push   ebp
  1001f9:	89 e5                	mov    ebp,esp
  1001fb:	83 ec 10             	sub    esp,0x10
  1001fe:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  100201:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  100204:	eb 04                	jmp    10020a <strcat+0x12>
  100206:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
  10020a:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  10020d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  100210:	84 c0                	test   al,al
  100212:	75 f2                	jne    100206 <strcat+0xe>
  100214:	eb 13                	jmp    100229 <strcat+0x31>
  100216:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100219:	0f b6 10             	movzx  edx,BYTE PTR [eax]
  10021c:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  10021f:	88 10                	mov    BYTE PTR [eax],dl
  100221:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
  100225:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
  100229:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  10022c:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  10022f:	84 c0                	test   al,al
  100231:	75 e3                	jne    100216 <strcat+0x1e>
  100233:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  100236:	c6 00 00             	mov    BYTE PTR [eax],0x0
  100239:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  10023c:	c9                   	leave  
  10023d:	c3                   	ret    

0010023e <strlen>:
  10023e:	55                   	push   ebp
  10023f:	89 e5                	mov    ebp,esp
  100241:	83 ec 10             	sub    esp,0x10
  100244:	eb 04                	jmp    10024a <strlen+0xc>
  100246:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
  10024a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  10024d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  100250:	84 c0                	test   al,al
  100252:	0f 95 c0             	setne  al
  100255:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
  100259:	84 c0                	test   al,al
  10025b:	75 e9                	jne    100246 <strlen+0x8>
  10025d:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  100260:	c9                   	leave  
  100261:	c3                   	ret    
	...

00100264 <move_cursor>:
  100264:	55                   	push   ebp
  100265:	89 e5                	mov    ebp,esp
  100267:	83 ec 28             	sub    esp,0x28
  10026a:	0f b6 05 05 a0 10 00 	movzx  eax,BYTE PTR ds:0x10a005
  100271:	0f b6 d0             	movzx  edx,al
  100274:	89 d0                	mov    eax,edx
  100276:	c1 e0 02             	shl    eax,0x2
  100279:	01 d0                	add    eax,edx
  10027b:	c1 e0 04             	shl    eax,0x4
  10027e:	89 c2                	mov    edx,eax
  100280:	0f b6 05 04 a0 10 00 	movzx  eax,BYTE PTR ds:0x10a004
  100287:	0f b6 c0             	movzx  eax,al
  10028a:	01 d0                	add    eax,edx
  10028c:	66 89 45 f6          	mov    WORD PTR [ebp-0xa],ax
  100290:	c7 44 24 04 0e 00 00 	mov    DWORD PTR [esp+0x4],0xe
  100297:	00 
  100298:	c7 04 24 d4 03 00 00 	mov    DWORD PTR [esp],0x3d4
  10029f:	e8 c4 fd ff ff       	call   100068 <outb>
  1002a4:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
  1002a8:	66 c1 e8 08          	shr    ax,0x8
  1002ac:	0f b6 c0             	movzx  eax,al
  1002af:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  1002b3:	c7 04 24 d5 03 00 00 	mov    DWORD PTR [esp],0x3d5
  1002ba:	e8 a9 fd ff ff       	call   100068 <outb>
  1002bf:	c7 44 24 04 0f 00 00 	mov    DWORD PTR [esp+0x4],0xf
  1002c6:	00 
  1002c7:	c7 04 24 d4 03 00 00 	mov    DWORD PTR [esp],0x3d4
  1002ce:	e8 95 fd ff ff       	call   100068 <outb>
  1002d3:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
  1002d7:	0f b6 c0             	movzx  eax,al
  1002da:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  1002de:	c7 04 24 d5 03 00 00 	mov    DWORD PTR [esp],0x3d5
  1002e5:	e8 7e fd ff ff       	call   100068 <outb>
  1002ea:	c9                   	leave  
  1002eb:	c3                   	ret    

001002ec <console_clear>:
  1002ec:	55                   	push   ebp
  1002ed:	89 e5                	mov    ebp,esp
  1002ef:	83 ec 18             	sub    esp,0x18
  1002f2:	c6 45 f3 0f          	mov    BYTE PTR [ebp-0xd],0xf
  1002f6:	0f b6 45 f3          	movzx  eax,BYTE PTR [ebp-0xd]
  1002fa:	c1 e0 08             	shl    eax,0x8
  1002fd:	83 c8 20             	or     eax,0x20
  100300:	66 89 45 f0          	mov    WORD PTR [ebp-0x10],ax
  100304:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
  10030b:	eb 17                	jmp    100324 <console_clear+0x38>
  10030d:	a1 00 10 10 00       	mov    eax,ds:0x101000
  100312:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
  100315:	01 d2                	add    edx,edx
  100317:	01 c2                	add    edx,eax
  100319:	0f b7 45 f0          	movzx  eax,WORD PTR [ebp-0x10]
  10031d:	66 89 02             	mov    WORD PTR [edx],ax
  100320:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
  100324:	81 7d f4 cf 07 00 00 	cmp    DWORD PTR [ebp-0xc],0x7cf
  10032b:	7e e0                	jle    10030d <console_clear+0x21>
  10032d:	c6 05 04 a0 10 00 00 	mov    BYTE PTR ds:0x10a004,0x0
  100334:	c6 05 05 a0 10 00 00 	mov    BYTE PTR ds:0x10a005,0x0
  10033b:	e8 24 ff ff ff       	call   100264 <move_cursor>
  100340:	c9                   	leave  
  100341:	c3                   	ret    

00100342 <scroll>:
  100342:	55                   	push   ebp
  100343:	89 e5                	mov    ebp,esp
  100345:	83 ec 10             	sub    esp,0x10
  100348:	c6 45 fb 0f          	mov    BYTE PTR [ebp-0x5],0xf
  10034c:	0f b6 45 fb          	movzx  eax,BYTE PTR [ebp-0x5]
  100350:	c1 e0 08             	shl    eax,0x8
  100353:	83 c8 20             	or     eax,0x20
  100356:	66 89 45 f8          	mov    WORD PTR [ebp-0x8],ax
  10035a:	0f b6 05 05 a0 10 00 	movzx  eax,BYTE PTR ds:0x10a005
  100361:	3c 18                	cmp    al,0x18
  100363:	76 67                	jbe    1003cc <scroll+0x8a>
  100365:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  10036c:	eb 25                	jmp    100393 <scroll+0x51>
  10036e:	a1 00 10 10 00       	mov    eax,ds:0x101000
  100373:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
  100376:	01 d2                	add    edx,edx
  100378:	01 c2                	add    edx,eax
  10037a:	a1 00 10 10 00       	mov    eax,ds:0x101000
  10037f:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
  100382:	83 c1 50             	add    ecx,0x50
  100385:	01 c9                	add    ecx,ecx
  100387:	01 c8                	add    eax,ecx
  100389:	0f b7 00             	movzx  eax,WORD PTR [eax]
  10038c:	66 89 02             	mov    WORD PTR [edx],ax
  10038f:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
  100393:	81 7d fc 7f 07 00 00 	cmp    DWORD PTR [ebp-0x4],0x77f
  10039a:	7e d2                	jle    10036e <scroll+0x2c>
  10039c:	c7 45 fc 80 07 00 00 	mov    DWORD PTR [ebp-0x4],0x780
  1003a3:	eb 17                	jmp    1003bc <scroll+0x7a>
  1003a5:	a1 00 10 10 00       	mov    eax,ds:0x101000
  1003aa:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
  1003ad:	01 d2                	add    edx,edx
  1003af:	01 c2                	add    edx,eax
  1003b1:	0f b7 45 f8          	movzx  eax,WORD PTR [ebp-0x8]
  1003b5:	66 89 02             	mov    WORD PTR [edx],ax
  1003b8:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
  1003bc:	81 7d fc cf 07 00 00 	cmp    DWORD PTR [ebp-0x4],0x7cf
  1003c3:	7e e0                	jle    1003a5 <scroll+0x63>
  1003c5:	c6 05 05 a0 10 00 18 	mov    BYTE PTR ds:0x10a005,0x18
  1003cc:	c9                   	leave  
  1003cd:	c3                   	ret    

001003ce <console_putc_color>:
  1003ce:	55                   	push   ebp
  1003cf:	89 e5                	mov    ebp,esp
  1003d1:	83 ec 28             	sub    esp,0x28
  1003d4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  1003d7:	88 45 e4             	mov    BYTE PTR [ebp-0x1c],al
  1003da:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  1003dd:	88 45 f7             	mov    BYTE PTR [ebp-0x9],al
  1003e0:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  1003e3:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
  1003e6:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
  1003ea:	c1 e0 04             	shl    eax,0x4
  1003ed:	0f b6 55 f6          	movzx  edx,BYTE PTR [ebp-0xa]
  1003f1:	83 e2 0f             	and    edx,0xf
  1003f4:	09 d0                	or     eax,edx
  1003f6:	88 45 f5             	mov    BYTE PTR [ebp-0xb],al
  1003f9:	0f b6 45 f5          	movzx  eax,BYTE PTR [ebp-0xb]
  1003fd:	c1 e0 08             	shl    eax,0x8
  100400:	66 89 45 f2          	mov    WORD PTR [ebp-0xe],ax
  100404:	80 7d e4 08          	cmp    BYTE PTR [ebp-0x1c],0x8
  100408:	75 1f                	jne    100429 <console_putc_color+0x5b>
  10040a:	0f b6 05 04 a0 10 00 	movzx  eax,BYTE PTR ds:0x10a004
  100411:	84 c0                	test   al,al
  100413:	74 14                	je     100429 <console_putc_color+0x5b>
  100415:	0f b6 05 04 a0 10 00 	movzx  eax,BYTE PTR ds:0x10a004
  10041c:	83 e8 01             	sub    eax,0x1
  10041f:	a2 04 a0 10 00       	mov    ds:0x10a004,al
  100424:	e9 97 00 00 00       	jmp    1004c0 <console_putc_color+0xf2>
  100429:	80 7d e4 09          	cmp    BYTE PTR [ebp-0x1c],0x9
  10042d:	75 14                	jne    100443 <console_putc_color+0x75>
  10042f:	0f b6 05 04 a0 10 00 	movzx  eax,BYTE PTR ds:0x10a004
  100436:	83 c0 08             	add    eax,0x8
  100439:	83 e0 f8             	and    eax,0xfffffff8
  10043c:	a2 04 a0 10 00       	mov    ds:0x10a004,al
  100441:	eb 7d                	jmp    1004c0 <console_putc_color+0xf2>
  100443:	80 7d e4 0d          	cmp    BYTE PTR [ebp-0x1c],0xd
  100447:	75 09                	jne    100452 <console_putc_color+0x84>
  100449:	c6 05 04 a0 10 00 00 	mov    BYTE PTR ds:0x10a004,0x0
  100450:	eb 6e                	jmp    1004c0 <console_putc_color+0xf2>
  100452:	80 7d e4 0a          	cmp    BYTE PTR [ebp-0x1c],0xa
  100456:	75 18                	jne    100470 <console_putc_color+0xa2>
  100458:	c6 05 04 a0 10 00 00 	mov    BYTE PTR ds:0x10a004,0x0
  10045f:	0f b6 05 05 a0 10 00 	movzx  eax,BYTE PTR ds:0x10a005
  100466:	83 c0 01             	add    eax,0x1
  100469:	a2 05 a0 10 00       	mov    ds:0x10a005,al
  10046e:	eb 50                	jmp    1004c0 <console_putc_color+0xf2>
  100470:	80 7d e4 1f          	cmp    BYTE PTR [ebp-0x1c],0x1f
  100474:	7e 4a                	jle    1004c0 <console_putc_color+0xf2>
  100476:	8b 0d 00 10 10 00    	mov    ecx,DWORD PTR ds:0x101000
  10047c:	0f b6 05 05 a0 10 00 	movzx  eax,BYTE PTR ds:0x10a005
  100483:	0f b6 d0             	movzx  edx,al
  100486:	89 d0                	mov    eax,edx
  100488:	c1 e0 02             	shl    eax,0x2
  10048b:	01 d0                	add    eax,edx
  10048d:	c1 e0 04             	shl    eax,0x4
  100490:	89 c2                	mov    edx,eax
  100492:	0f b6 05 04 a0 10 00 	movzx  eax,BYTE PTR ds:0x10a004
  100499:	0f b6 c0             	movzx  eax,al
  10049c:	01 d0                	add    eax,edx
  10049e:	01 c0                	add    eax,eax
  1004a0:	8d 14 01             	lea    edx,[ecx+eax*1]
  1004a3:	66 0f be 4d e4       	movsx  cx,BYTE PTR [ebp-0x1c]
  1004a8:	0f b7 45 f2          	movzx  eax,WORD PTR [ebp-0xe]
  1004ac:	09 c8                	or     eax,ecx
  1004ae:	66 89 02             	mov    WORD PTR [edx],ax
  1004b1:	0f b6 05 04 a0 10 00 	movzx  eax,BYTE PTR ds:0x10a004
  1004b8:	83 c0 01             	add    eax,0x1
  1004bb:	a2 04 a0 10 00       	mov    ds:0x10a004,al
  1004c0:	0f b6 05 04 a0 10 00 	movzx  eax,BYTE PTR ds:0x10a004
  1004c7:	3c 4f                	cmp    al,0x4f
  1004c9:	76 16                	jbe    1004e1 <console_putc_color+0x113>
  1004cb:	c6 05 04 a0 10 00 00 	mov    BYTE PTR ds:0x10a004,0x0
  1004d2:	0f b6 05 05 a0 10 00 	movzx  eax,BYTE PTR ds:0x10a005
  1004d9:	83 c0 01             	add    eax,0x1
  1004dc:	a2 05 a0 10 00       	mov    ds:0x10a005,al
  1004e1:	e8 5c fe ff ff       	call   100342 <scroll>
  1004e6:	e8 79 fd ff ff       	call   100264 <move_cursor>
  1004eb:	c9                   	leave  
  1004ec:	c3                   	ret    

001004ed <console_write>:
  1004ed:	55                   	push   ebp
  1004ee:	89 e5                	mov    ebp,esp
  1004f0:	83 ec 18             	sub    esp,0x18
  1004f3:	eb 25                	jmp    10051a <console_write+0x2d>
  1004f5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  1004f8:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  1004fb:	0f be c0             	movsx  eax,al
  1004fe:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
  100502:	c7 44 24 08 0f 00 00 	mov    DWORD PTR [esp+0x8],0xf
  100509:	00 
  10050a:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  100511:	00 
  100512:	89 04 24             	mov    DWORD PTR [esp],eax
  100515:	e8 b4 fe ff ff       	call   1003ce <console_putc_color>
  10051a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  10051d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  100520:	84 c0                	test   al,al
  100522:	75 d1                	jne    1004f5 <console_write+0x8>
  100524:	c9                   	leave  
  100525:	c3                   	ret    

00100526 <console_write_color>:
  100526:	55                   	push   ebp
  100527:	89 e5                	mov    ebp,esp
  100529:	83 ec 18             	sub    esp,0x18
  10052c:	eb 23                	jmp    100551 <console_write_color+0x2b>
  10052e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  100531:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  100534:	0f be c0             	movsx  eax,al
  100537:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
  10053b:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
  10053e:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  100542:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
  100545:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  100549:	89 04 24             	mov    DWORD PTR [esp],eax
  10054c:	e8 7d fe ff ff       	call   1003ce <console_putc_color>
  100551:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  100554:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  100557:	84 c0                	test   al,al
  100559:	75 d3                	jne    10052e <console_write_color+0x8>
  10055b:	c9                   	leave  
  10055c:	c3                   	ret    
  10055d:	00 00                	add    BYTE PTR [eax],al
	...

00100560 <elf_from_multiboot>:
  100560:	55                   	push   ebp
  100561:	89 e5                	mov    ebp,esp
  100563:	83 ec 38             	sub    esp,0x38
  100566:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100569:	8b 40 24             	mov    eax,DWORD PTR [eax+0x24]
  10056c:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  10056f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100572:	8b 50 28             	mov    edx,DWORD PTR [eax+0x28]
  100575:	89 d0                	mov    eax,edx
  100577:	c1 e0 02             	shl    eax,0x2
  10057a:	01 d0                	add    eax,edx
  10057c:	c1 e0 03             	shl    eax,0x3
  10057f:	03 45 f0             	add    eax,DWORD PTR [ebp-0x10]
  100582:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  100585:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
  100588:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
  10058f:	e9 a2 00 00 00       	jmp    100636 <elf_from_multiboot+0xd6>
  100594:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
  100597:	89 d0                	mov    eax,edx
  100599:	c1 e0 02             	shl    eax,0x2
  10059c:	01 d0                	add    eax,edx
  10059e:	c1 e0 03             	shl    eax,0x3
  1005a1:	03 45 f0             	add    eax,DWORD PTR [ebp-0x10]
  1005a4:	8b 00                	mov    eax,DWORD PTR [eax]
  1005a6:	03 45 ec             	add    eax,DWORD PTR [ebp-0x14]
  1005a9:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
  1005ac:	c7 44 24 04 17 10 10 	mov    DWORD PTR [esp+0x4],0x101017
  1005b3:	00 
  1005b4:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
  1005b7:	89 04 24             	mov    DWORD PTR [esp],eax
  1005ba:	e8 9c fb ff ff       	call   10015b <strcmp>
  1005bf:	85 c0                	test   eax,eax
  1005c1:	75 2c                	jne    1005ef <elf_from_multiboot+0x8f>
  1005c3:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
  1005c6:	89 d0                	mov    eax,edx
  1005c8:	c1 e0 02             	shl    eax,0x2
  1005cb:	01 d0                	add    eax,edx
  1005cd:	c1 e0 03             	shl    eax,0x3
  1005d0:	03 45 f0             	add    eax,DWORD PTR [ebp-0x10]
  1005d3:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  1005d6:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
  1005d9:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
  1005dc:	89 d0                	mov    eax,edx
  1005de:	c1 e0 02             	shl    eax,0x2
  1005e1:	01 d0                	add    eax,edx
  1005e3:	c1 e0 03             	shl    eax,0x3
  1005e6:	03 45 f0             	add    eax,DWORD PTR [ebp-0x10]
  1005e9:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
  1005ec:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
  1005ef:	c7 44 24 04 1f 10 10 	mov    DWORD PTR [esp+0x4],0x10101f
  1005f6:	00 
  1005f7:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
  1005fa:	89 04 24             	mov    DWORD PTR [esp],eax
  1005fd:	e8 59 fb ff ff       	call   10015b <strcmp>
  100602:	85 c0                	test   eax,eax
  100604:	75 2c                	jne    100632 <elf_from_multiboot+0xd2>
  100606:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
  100609:	89 d0                	mov    eax,edx
  10060b:	c1 e0 02             	shl    eax,0x2
  10060e:	01 d0                	add    eax,edx
  100610:	c1 e0 03             	shl    eax,0x3
  100613:	03 45 f0             	add    eax,DWORD PTR [ebp-0x10]
  100616:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  100619:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
  10061c:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
  10061f:	89 d0                	mov    eax,edx
  100621:	c1 e0 02             	shl    eax,0x2
  100624:	01 d0                	add    eax,edx
  100626:	c1 e0 03             	shl    eax,0x3
  100629:	03 45 f0             	add    eax,DWORD PTR [ebp-0x10]
  10062c:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
  10062f:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
  100632:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
  100636:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
  100639:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  10063c:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
  10063f:	39 c2                	cmp    edx,eax
  100641:	0f 82 4d ff ff ff    	jb     100594 <elf_from_multiboot+0x34>
  100647:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  10064a:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
  10064d:	89 10                	mov    DWORD PTR [eax],edx
  10064f:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
  100652:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
  100655:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
  100658:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
  10065b:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
  10065e:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
  100661:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  100664:	c9                   	leave  
  100665:	c2 04 00             	ret    0x4

00100668 <elf_lookup_symbol>:
  100668:	55                   	push   ebp
  100669:	89 e5                	mov    ebp,esp
  10066b:	53                   	push   ebx
  10066c:	83 ec 14             	sub    esp,0x14
  10066f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
  100676:	e9 92 00 00 00       	jmp    10070d <elf_lookup_symbol+0xa5>
  10067b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  10067e:	8b 08                	mov    ecx,DWORD PTR [eax]
  100680:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
  100683:	89 d0                	mov    eax,edx
  100685:	01 c0                	add    eax,eax
  100687:	01 d0                	add    eax,edx
  100689:	c1 e0 03             	shl    eax,0x3
  10068c:	01 c8                	add    eax,ecx
  10068e:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  100691:	83 e0 0f             	and    eax,0xf
  100694:	83 f8 02             	cmp    eax,0x2
  100697:	75 6f                	jne    100708 <elf_lookup_symbol+0xa0>
  100699:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  10069c:	8b 08                	mov    ecx,DWORD PTR [eax]
  10069e:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
  1006a1:	89 d0                	mov    eax,edx
  1006a3:	01 c0                	add    eax,eax
  1006a5:	01 d0                	add    eax,edx
  1006a7:	c1 e0 03             	shl    eax,0x3
  1006aa:	01 c8                	add    eax,ecx
  1006ac:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  1006af:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
  1006b2:	77 55                	ja     100709 <elf_lookup_symbol+0xa1>
  1006b4:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  1006b7:	8b 08                	mov    ecx,DWORD PTR [eax]
  1006b9:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
  1006bc:	89 d0                	mov    eax,edx
  1006be:	01 c0                	add    eax,eax
  1006c0:	01 d0                	add    eax,edx
  1006c2:	c1 e0 03             	shl    eax,0x3
  1006c5:	01 c8                	add    eax,ecx
  1006c7:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
  1006ca:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  1006cd:	8b 18                	mov    ebx,DWORD PTR [eax]
  1006cf:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
  1006d2:	89 d0                	mov    eax,edx
  1006d4:	01 c0                	add    eax,eax
  1006d6:	01 d0                	add    eax,edx
  1006d8:	c1 e0 03             	shl    eax,0x3
  1006db:	01 d8                	add    eax,ebx
  1006dd:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
  1006e0:	01 c8                	add    eax,ecx
  1006e2:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
  1006e5:	76 22                	jbe    100709 <elf_lookup_symbol+0xa1>
  1006e7:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  1006ea:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
  1006ed:	89 c1                	mov    ecx,eax
  1006ef:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  1006f2:	8b 18                	mov    ebx,DWORD PTR [eax]
  1006f4:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
  1006f7:	89 d0                	mov    eax,edx
  1006f9:	01 c0                	add    eax,eax
  1006fb:	01 d0                	add    eax,edx
  1006fd:	c1 e0 03             	shl    eax,0x3
  100700:	01 d8                	add    eax,ebx
  100702:	8b 00                	mov    eax,DWORD PTR [eax]
  100704:	01 c8                	add    eax,ecx
  100706:	eb 2d                	jmp    100735 <elf_lookup_symbol+0xcd>
  100708:	90                   	nop
  100709:	83 45 f8 01          	add    DWORD PTR [ebp-0x8],0x1
  10070d:	8b 4d f8             	mov    ecx,DWORD PTR [ebp-0x8]
  100710:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100713:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  100716:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
  100719:	ba ab aa aa aa       	mov    edx,0xaaaaaaab
  10071e:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
  100721:	f7 e2                	mul    edx
  100723:	89 d0                	mov    eax,edx
  100725:	c1 e8 04             	shr    eax,0x4
  100728:	39 c1                	cmp    ecx,eax
  10072a:	0f 82 4b ff ff ff    	jb     10067b <elf_lookup_symbol+0x13>
  100730:	b8 00 00 00 00       	mov    eax,0x0
  100735:	83 c4 14             	add    esp,0x14
  100738:	5b                   	pop    ebx
  100739:	5d                   	pop    ebp
  10073a:	c3                   	ret    
	...
