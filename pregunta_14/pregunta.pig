/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       color 
   FROM 
       u 
   WHERE 
       color NOT LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/
data= LOAD 'data.csv' USING PigStorage(',') AS (c1:int, c2:chararray, c3:chararray, c4:chararray, color:chararray, c6:int);
data_1= FOREACH data GENERATE color;
data_2= FILTER data_1 BY color != '^b';
STORE data_2 INTO 'output' USING PigStorage(',');
