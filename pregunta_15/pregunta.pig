/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname,
       color
   FROM 
       u 
   WHERE color = 'blue' AND firstname LIKE 'Z%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/

data= LOAD 'data.csv' USING PigStorage(',') AS (c1:int, firstname:chararray, c3:chararray, c4:chararray, color:chararray, c6:int);
data_1= FOREACH data GENERATE firstname, color;
data_2= FILTER data_1 BY color == 'blue' AND firstname=='^Z';
STORE data_2 INTO 'output' USING PigStorage(',');