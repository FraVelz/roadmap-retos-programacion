#!/bin/bash

# Pagina oficial de Bash: 
# https://www.gnu.org/software/bash/manual/bash.html 


# COMENTARIOS ********************************************************

# Unica forma de crear un comentario en bash.

: ' 
Pero con ciertos comandos, 
se puede simular un comentario
multilinea.

tener en cuenta que en bash script,
todo se interpleta como un comando, 
entonces puede ser sensible a espacios,
un espacio de mas o menos puede afectar,
la funcionalidad del codigo.

incluso hasta declarando variables.
'

<< 'eof'
tambien de esta forma 
se puede simular un 
comentario multilinea.
eof

# VARIABLES **********************************************************

# Variable normal
variable=texto1

# Variable Constante
declare -r constante1="declaracion de una constante"
readonly constante2="declarancion de otra constante"

# TIPOS DE DATOS *****************************************************

# El unico tipo de dato es el string en bash
texto1=stringSinEspacios
texto2="String con espacios"
texto3='String que no se puede formatear(concatenar)'

# No existe el tipo de dato bool pero hay comandos que lo simulan
true
false

# Para hacer operaciones entre enteros hay comandos que hace
# hacen que un string se comporte como numeros.

# IMPRIMIR POR CONSOLA ***********************************************
echo "Hola, Bash Script!"

# Autor: Fravelz
