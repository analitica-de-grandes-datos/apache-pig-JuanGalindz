/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
a = LOAD 'data.tsv' AS 
        ( letras:charArray,
          letter_bag:bag{},
          lista:map[]);

b = FOREACH a GENERATE letras, SIZE(letter_bag) as bags, SIZE(lista) as listas;
c = ORDER b BY letras, bags, listas;
STORE c INTO 'output' USING PigStorage(',');