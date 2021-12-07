.macro	abs
tst	r0,	r0
negami	r0,	r0
.endm


.data
var1:	.asciz	"%d\n"

.text
.global	main
main:	push	{r4,	lr}	//Salva registros
	mov	r0,	#1	//Primera llamda abs (1)
	bl	abs

	mov	r1,	r0	//Imprime primera llamada
	ldr	r0,	=var1
	bl	printf

	mov	r0,	#-2	//Segunda llmada abs (-2) imprime
	bl	abs
	mov	r1,	r0
	ldr	r0,	=var1
	bl	printf

	mov	r0,	#3	//terxera llamda abs (3)imprime
	bl	abs
	mov	r1,	r0
	ldr	r0,	=var1
	bl	printf

	mov	r0,	#-4	//Cuarta llamada abs (-4)imprime
	bl	abs
	mov	r1,	r0
	ldr	r0,	=var1
	bl	printf
	pop	{r4,	lr}
	bx	lr

abs:	tst	r0,	r0	//comprueba la bandera de signo
	negmi	r0,	r0	//si es negativo, negamos el nuevo
	bx	lr
