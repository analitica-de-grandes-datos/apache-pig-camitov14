/*
Pregunta
===========================================================================

Ordene el archivo `data.tsv`  por letra y valor (3ra columna). Escriba el
resultado separado por comas.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

     >>> Escriba el codigo del mapper a partir de este punto <<<
*/
data= LOAD 'data.tsv' USING PigStorage('\t') AS (letter:chararray, date:chararray, num:int);
ordered_data_1 = ORDER data BY letter asc;
ordered_data_2 = ORDER ordered_data_1 BY num asc;
STORE ordered_data_2 INTO 'output' USING PigStorage(',');
