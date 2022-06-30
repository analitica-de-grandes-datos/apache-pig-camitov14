/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data= LOAD 'data.csv' USING PigStorage(',') AS (c1:int, firstname:chararray, c3:chararray, birthday:chararray, color:chararray, c6:int);
data_1= FOREACH data GENERATE REGEX_EXTRACT(birthday, '(.*)-(.*)-(.*)', 1) AS year;
grouped = GROUP data_1 BY year;
result = FOREACH grouped GENERATE group, COUNT(data_1.year);
STORE result INTO 'output' USING PigStorage(',');

