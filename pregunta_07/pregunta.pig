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
data= LOAD 'data.tsv' USING PigStorage('\t') AS (c1:chararray, c2:BAG{}, c3:MAP[]);
data_1 = FOREACH data GENERATE c1, SIZE(c2), SIZE(c3) AS (c1_2:chararray, c2_c:long, c3_2:long);
ordered_data = ORDER data_1 BY c1_2 asc, c2_2 asc, c3_2 asc;
STORE ordered_data INTO 'output' USING PigStorage(',');