/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data= LOAD 'data.tsv' USING PigStorage('\t') AS (c1:chararray, c2:chararray, c3:chararray);
data_1 = FOREACH data GENERATE FLATTEN(TOKENIZE(c2) AS letter;
grouped=GROUP data_1 BY letter;
counter=FOREACH grouped GENERATE group, COUNT(data_1)
STORE counter INTO 'output' USING PigStorage(',');