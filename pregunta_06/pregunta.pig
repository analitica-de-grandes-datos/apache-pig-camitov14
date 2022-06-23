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
data_0= FOREACH data GENERATE REPLACE (c3,'[\\\'\\[\\]]+','');
data_1 = FOREACH data_0 GENERATE TOKENIZE(*) AS letter;
data_2= FOREACH data_1 GENERATE REGEX_EXTRACT(letter, '(.*)#(.*)', 1) AS letter_2;
grouped= GROUP data_2 BY letter_2;
counter= FOREACH grouped GENERATE group, COUNT(data_2);
STORE counter INTO 'output' USING PigStorage(',');
