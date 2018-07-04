.include "eqv.s"
.include "imagens.s"

.text

la a0, imagem
li a1, 16
li a2, 16
li a3, 40
li a4, 24
jal imprimeimagem

li a7, 10
ecall

imprimeimagem:
#a0 = endereco da imagem, cujo conteudo eh um vetor de bytes correspondendo a cor de cada pixel
#a1 = largura (x)	ex: 320
#a2 = altura (y)	ex: 240
#a3 = coordenada x desejada na tela
#a4 = coordenada y desejada na tela
li t6, BITMAP_ADDRESS
mv t0, a0

mv t4, a4
li t3, 320
mul t4, t4, t3
add t4, t4, a3
add t4, t4, t6		# t4 = endereco onde comecara a impressao de fato

sub t3, t3, a1
mv t5, a2
imprimeimagem.antesloop1:
srli t1, a1, 2 
imprimeimagem.loop1:
lw t2, 0(t0)
sw t2, 0(t4)
addi t0, t0, 4
addi t4, t4, 4
addi t1, t1, -1
beqz t1, imprimeimagem.out
j imprimeimagem.loop1

imprimeimagem.out:
add t4, t4, t3
addi t5, t5, -1
beqz t5, imprimeimagem.out2
j imprimeimagem.antesloop1

imprimeimagem.out2: ret
