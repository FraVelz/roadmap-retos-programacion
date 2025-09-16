#!/bin/bash

: '
La clave, para el aprendizaje es la practica, hay que practicar mucho
con bash script :v

/*
 * EJERCICIO:
 * - Crea ejemplos utilizando todos los tipos de operadores de tu lenguaje:
 *   Aritméticos, lógicos, de comparación, asignación, identidad, pertenencia, bits...
 *   (Ten en cuenta que cada lenguaje puede poseer unos diferentes)
 * - Utilizando las operaciones con operadores que tú quieras, crea ejemplos
 *   que representen todos los tipos de estructuras de control que existan
 *   en tu lenguaje:
 *   Condicionales, iterativas, excepciones...
 * - Debes hacer print por consola del resultado de todos los ejemplos.
 *
 * DIFICULTAD EXTRA (opcional):
 * Crea un programa que imprima por consola todos los números comprendidos
 * entre 10 y 55 (incluidos), pares, y que no son ni el 16 ni múltiplos de 3.
 *
 * Seguro que al revisar detenidamente las posibilidades has descubierto algo nuevo.
 */
'

# OPERADORES ARITMETICOS *********************************************
a=1
b=2

# comando para poder hacer operaciones aritmeticas:
# 1. $((...))         No es nesesario el '$' para las variables.
# 2. $(expr ...)

echo $(expr $a + $b)

echo $((a + b))  # Suma
echo $((a - b))  # Resta
echo $((a * b))  # Multiplicacion
echo $((a / b))  # Division
echo $((a % b))  # Resto (Modulo)
echo $((a ** b)) # Exponente

# OPERADORES DE COMPARACION ******************************************

: '
Operadores para String:
a != b (Diferente)
a = b  (Igual)
a < b  (Menor por orden Lexicografico)
a > b  (Menor por orden lexicografico)
-z a   (Cadena Vacia)
-n a   (Cadena No Vacia)

Operadores para datos numericos(String numericos):
-eq (Igual que)
-ne (Distinto que)
-lt (Menor que)
-le (Menor o igual que)
-gt (Mayor que)
-ge (Mayor o igual que)
'

if [[ 10 -eq 10 ]]; then 
    echo '10 y 10 son iguales numericamente'
fi

if [[ 10 = 10 ]]; then 
    echo '10 y 10 son strings iguales'
fi

# OPERADORES LOGICOS *************************************************
: '
Los operadores logicos son:
* and      (&&) (-a)
* or       (||) (-o)
* negacion (!)

Las diferentes formas de usar el operador logico (&&, ||):
* [[ cond1 && cond2 ]] //
* [cond1] && [cond2]   // [ cond1 -a cond2 ]

Operador de negacion:
* ! [ "$a" -eq 5 ]
* [[ ! $a -eq 5 ]]

'

if [[ 10 = 10 && 10 -eq 10 ]]; then 
    echo '10 y 10 son strings iguales, y numericamente iguales.'
fi

# OPERADORES DE ASIGNACION *******************************************

nombre=valor  # Asignacion basica String (No permitido los espacios).
              # (el simbolo igual no debe estar rodeado de espacios).
              # (bash script lo interpretaria como comandos diferentes
              #  si lleva espacio).

: '
Para usar operadores aritmeticos, se nesesita una forma de hacer que
las variables se comporten como numeros, porque nativamente son 
strings entonces se utiliza: 

* let ...    (forma antigua, genera facilmente errores)
* (( ... ))   (Mas moderno y legible, no tiene tantos problemas por 
               el uso de espacios)
'

(( x = 5 ))  # Asigna valor directo
(( x += 3 )) # Suma y asigna
(( x -= 2 )) # Resta y asigna
(( x *= 4 )) # Multiplica y asigna 
(( x /= 2 )) # Divide y asigna (entero)
(( x %= 3 )) # Módulo y asigna 

# Asignacion Aritmetica Incremento y Decremento

(( x++ ))   # Post-incremento 
(( x-- ))   # Post-decremento

(( ++x ))   # Pre-incremento 
(( --x ))   # Pre-decremento

# Asignacion con Expansion de Variables

${var=valor}  # Si `var` no está definida la define con `valor`.                      |
${var:-valor} # Usa `valor` si `var` está vacía o no definida, 
              # pero **no la cambia**.

${var:=valor} # Si `var` está vacía o no definida la asigna a `valor`.
${var:+valor} # Si `var` está definida → se expande a `valor`. Si no, 
              # se expande vacío.

# OPERADORES DE PERTENENCIA ******************************************

: '
Pertenencia en string(en la variable cadena existe/pertenece mundo):
[[ $cadena == *"mundo"* ]]
[[ $cadena =~ mundo ]]

Existen otros operadores, para otros tipos de cosas, pero los 
considero avanzado, y no hemos visto estructuras de datos basicos en 
bash :v
'

# OPERADORES DE CONTROL DE PROCESOS **********************************

: '
&  = ejecutar en segundo plano
&& = ejecutar el siguiente comando si el anterior fue exitoso
|| = ejecutar el siguiente comando si el anterior falló
;  = ejecutar secuencialmente
;; = cierre de un caso en case
|  = pipe (redirige la salida de un comando a otro)
'

ls && echo "Listado correcto"

# OPERADORES DE REDIRECCION ******************************************

: '
>  = redirige salida estándar a archivo (sobrescribe)
>> = redirige salida estándar a archivo (añade)
<  = redirige entrada desde archivo
2> = redirige error estándar a archivo
&> = redirige salida y errores al mismo archivo
|  = pipe (ya visto)
'

# OPERADORES DE COMPARACION DE ARCHIVOS ******************************

: '
-e → existe
-f → es archivo regular
-d → es directorio
-r → tiene permisos de lectura
-w → tiene permisos de escritura
-x → tiene permisos de ejecución
-s → no está vacío

file1 -nt file2 → file1 es más nuevo que file2
file1 -ot file2 → file1 es más viejo que file2
file1 -ef file2 → ambos se refieren al mismo archivo
'

# OPERADORES DE BIT A BIT ********************************************

(( x <<= 1 )) # Desplaza bits a la izquierda
(( x >>= 1 )) # Desplaza bits a la derecha
(( x &= 7 ))  # AND binario y asigna
(( x ^= 3 ))  # XOR binario y asigna
(( x | = 2 )) # OR binario y asigna

# ESTRUCTURAS DE CONTROL *********************************************

# Condicionales ******************************************************

: '
Para escribir condiciones hay 2 formas, para cada estructura:
'

# Case *******************************************

num=10

case $num in 
	1)
		echo "Elegiste uno"
		;;
	2)
		echo "Elegiste dos"
		;;
	*)
		echo "Numero desconocido :v"
		;;
esac


# Iterativas *********************************************************

# Bucles for *************************************

for fruta in manzana mango pera; do
	echo "Me gusta la $fruta"
done

for i in {1..3}; do 
	echo "Contando: $i"
done 

for (( j=10; j>=5; j-- )) do 
	echo "Cuenta regresiva: $j"
done

# Bucles while ***********************************
i=0

while [[ $i -lt 3 ]] do 
	echo "i = $i"
	((i++))
done

# Leer archivo 

#while read line; do 
#	echo "- $line"
#done < archivo.txt

# Bucles until ***********************************

: '
igual que el while pero a diferencia de que 
mientras la condicion sea falsa se sigue 
ejecutando.
'

# Continue/break *********************************

: '
se utiliza continue para continuar en el bucle y
break para romper en el bucle como cualquier otro
lenguaje de programacion.

con excepcion de que si hay N bucles anidados y
en el interior de todos colocas un break x, 
rompera todos los N bucles anidados, siempre y 
cuando x = N, estaria rompiendo los x bucles
anidados.
'

# EXEPCIONES *********************************************************


# EJERCICIO DIFICULTAD EXTRA *****************************************

# Autor: Fravelz.
