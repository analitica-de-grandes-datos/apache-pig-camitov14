/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname, 
       LOCATE('ia', firstname) 
   FROM 
       u;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data= LOAD 'data.csv' USING PigStorage(',') AS (c1:int, firstname:chararray, c3:chararray, birthday:chararray, color:chararray, c6:int);
data_1= FOREACH data GENERATE INDEXOF(firstname,'ia',1);
STORE data_1 INTO 'output' USING PigStorage(',');
