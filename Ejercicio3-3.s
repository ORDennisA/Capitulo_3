/*
Titulo: Ejercicio 3 Capitulo3
Autor: Dennis Axel Ruiz Ochoa
*/
.data
var1:	.asciz	"%d\n"

.text
.global main
main:	push	{r4,	lr}	//salva registros
	mov	r4,	#0	//introduce los 4 primeros parametros via registros

bucle:	mov	r0,	r4	//toma contador como parametro
	bl	fibo		//llama a lafuncion
	mov	r1,	r0	//paso resultado a r1
	ldr	r0,	=var1	//pongo cadena en r0
	bl	printf		//llama a funcion printf
	add	r4,	r4,	#1	//incrementa contador
	cmp	r4,	#10	//compara  si es emnor a 10 sale del bucle
	bne	bucle		//si llegamos a 10	salgo del bucle

	pop	{r4,	lr}	//recupera registros y sale del main
	bx	lr

	.equ	local1,	0
	.equ	local2,	4+local1
	.equ	local3,	4+local2
	.equ	length,	4+local3

fibo:	push	{lr}		//salvaguarda	lr
	sub	sp,	#length	//hago espacio v.locales
	cmp	r0,	#2	//if n < 2
	movlo	r0,	#1	//return 1
	blo	fib1

	sub	r0,	#1	//else	
	str	r0,	[sp,	#local1]	//salvo n-1 en [sp]
	bl	fibo		//fibonacci (n-1)
	str	r0,	[sp,	#local2]	//salva salida de fib. (n-1)
	ldr	r0,	[sp,	#local1]	//recuerpa de la pila n-1
	sub	r0,	#1	//calulo n-2
	bl	fibo		//fibonacci (n-1)
	ldr	r1,	[sp,	#local2]	//recuepar salida de fib (n-1)
	add	r0,	r1

fib1:	add	sp,	#length	//libera espacio de v.locales
	pop	{lr}		//recuepra registros, solo lr
	bx	lr		//salgo	 de la funcion

	                                                                          
