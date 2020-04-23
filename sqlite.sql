-- rm /tmp/sa.sqlite ; sqlite3 /tmp/sa.sqlite <sqlite.sql ;sqlite3 /tmp/sa.sqlite "select * from  superannuated1909 limit 2;"; ls -lh superannuated1909.fwf  /tmp/sa.sqlite


CREATE TABLE fixed_width_table
(
    full_string CHAR
);
.import superannuated1909.fwf fixed_width_table

CREATE TABLE superannuated1909 AS
Select
       CAST(SUBSTR(full_string, 1 + 0, 11 - 0) as NUMERIC)  AS 'SalesNo',
       SUBSTR(full_string, 1 + 11, 15 - 11)                 AS 'SalesAreaID',
       DATE(SUBSTR(full_string, 1 + 15, 25 - 15))           AS 'date',
       SUBSTR(full_string, 1 + 25, 40 - 25)                 AS 'PluNo',
       SUBSTR(full_string, 1 + 40, 60 - 40)                 AS 'ItemName',
       CAST(SUBSTR(full_string, 1 + 60, 82 - 60) as float)  AS 'Quantity',
       CAST(SUBSTR(full_string, 1 + 82, 103 - 82) as float) AS 'Amount',
       SUBSTR(full_string, 1 + 103, 108 - 103)              AS 'TransMode'
FROM fixed_width_table
