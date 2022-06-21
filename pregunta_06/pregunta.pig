/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data= LOAD 'data.tsv' USING PigStorage('\t') AS (c1:chararray, c2:chararray, c3:chararray);
data_1 = FOREACH data GENERATE FLATTEN(TOKENIZE(c3)) AS letter;
data_2= FOREACH letter GENERATE REGEX_EXTRACT(data_1, '(.*)#(.*)', 1);
grouped= GROUP data_1 BY data_2;
counter= FOREACH grouped GENERATE group, COUNT(data_1);
STORE counter INTO 'output' USING PigStorage(',');
