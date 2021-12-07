/*
Titulo: Ejercicio 2 Capitulo3
Autor: Dennis Axel Ruiz Ochoa
*/
.data
var1:	.asciz	"%d\n"
seed:	.word	1
const1:	.word	1103515245
const2:	.word	12345

.text
.global main
main:	push	{r4,	r5}	//Salva registros
	mov	r0,	#42	//Inicailizador del bucle a 0 en r4
	bl	mysrand
	mov	r4,	#5

bucle:	bl	myrand		//llama a la funcion
	mov	r1,	r0
	ldr	r0,	=var1	//pongo cadena en r0
	bl	printf		//llama a la funcion printf
	subs	r4,	r4,	#1	//compara si es menor de 10
	bne	bucle 		//si llegamos a 10 sale de bucle

	pop	{r4,	r5}	//recupera registros y sale de main
	bx	lr

myrand:	ldr	r1,	=seed
	ldr	r0,	[r1]
	ldr	r2,	[r1,	#4]
	mul	r3,	r0,	r2
	ldr	r0,	[r1,	#8]
	add	r0,	r0,	r3
	str	r0,	[r1]
	mov	r0,	r0,	LSL	#1
	mov	r0,	r0,	LSR	#17
	bx	lr

mysrand:	ldr	r1,	=seed
	str	r0,	[r1]
	bx	lr
