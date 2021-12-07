.data
var1:	.asciz	"%d\n"

.text
.global main
main:	push	{r4,	lr}	//salva registros
	mov	r0,	#1	//introduce los 4 primeros parametros via registros
	mov	r1,	#2
	mov	r2,	#3
	mov	r3,	#4

	mov	r4,	#5	//Introduce el quinto parametro
	push	{r4}

	bl	poly3		//llama a funcion pol3(1,2,3,4,5)
	add	sp,	#4	//Equlibro la pila (debido al 5 parametro)

	mov	r1,	r0		//Paso resultado de la funcion a r1, cadena a imprimir a r0 y llama a la funcion
	ldr	r0,	=var1
	bl	printf

	mov	r0,	#1	//Segunda llamada esta vez poly3(1,,-1,1,-1,8)
	mov	r1,	#-1
	mov	r2,	#1
	mov	r3,	#-1
	mov	r4,	#8
	push	{r4}
	bl	poly3
	add	sp,	#4

	mov	r1,	r0	//imprime resultado de segunda llamada
	ldr	r0,	=var1
	bl	printf

	mov	r0,	#1	//Segunda llamada, esta vez poly(1,-1,1,-1,8)
	mov	r1,	#-1
	mov	r2,	#1
	mov	r3,	#-1
	mov	r4,	#8
	push	{r4}
	bl	poly3
	add	sp,	#4

	mov	r1,	r0	//Imprime resultado de segunda llamda
	ldr	r0,	=var1
	bl	printf

	mov	r0,	#2	//Llama e imprime poly3(2,0,0,0,8)
	mov	r1,	#0
	mov	r2,	#0
	mov	r3,	#0
	mov	r4,	#8
	push	{r4}
	bl	poly3
	add	sp,	#4
	mov	r1,	r0
	ldr	r0,	=var1
	bl	printf

	pop	{r4, 	lr}	//recupera registros
	bx	lr

	.equ	param5,	4*5	//r4

poly3:	push	{r4}		//salvaguarda r4
	ldr	r4,	[sp,	#param5]	//lee r4 de la pila
	smlabb	r3,	r2,	r4,	r3	//r3 = c*x +d
	smulbb	r2,	r4,	r4		//r2 = x*x
	smlabb	r3,	r1,	r2,	r3	//r3=b*(x*x) + (c*x+d)
	smulbb	r2,	r2,	r4		//r2=x*(x*x)
	smlabb	r0,	r0,	r2,	r3	//r0=a*x*x*x + b*x*x + c*x+d
	pop	{r4}				//recupera r4
	bx	lr				//sale de la funcion
