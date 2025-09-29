%let pgm=utl-sqllite-odbc-driver-works-in-r-but-not-in-personal-altair-slc;

%stop_submission;

Sqllite odbc driver works in r but not in personal altair slc

There are no database passwords in this post

I did not rebbot or exit the the slc and restart, because R worked?

Too long to pot in a listserve, see github.

github
https://tinyurl.com/5au8cwpk
https://github.com/rogerjdeangelis/utl-sqllite-odbc-driver-works-in-r-but-not-in-personal-altair-slc

CONTENTS

   1 r works
   2 slc fails dsn
   3 slc fails drvr string

/*                          _      _
 _ __  _ __ ___ _ __     __| |_ __(_)_   _____ _ __
| `_ \| `__/ _ \ `_ \   / _` | `__| \ \ / / _ \ `__|
| |_) | | |  __/ |_) | | (_| | |  | |\ V /  __/ |
| .__/|_|  \___| .__/   \__,_|_|  |_| \_/ \___|_|
|_|            |_|
*/

Always create a restore point before installing software
You might not be able to download the driver because of the HTTP is not HTTPS
Allow chrome to download http addtess, click on chrome three dots

Download driver
http://www.ch-werner.de/sqliteodbc/sqliteodbc_w64.exe

From memory - steps should be right but doc text may not be exact.
After install the  driver will be added

open odbc adminstrator 64bit (I have 64bt Personal ALtair SLC)

   click on system tab
   you should see sqlite
   sqllite 3 datasorce  64bit

To install a DSN
   Go to File DSN
    Add the sqlit3 driver
    Select a file for your database
    apply and close

You now have a DSN driver and a connection string driver

/*                             _
/ |  _ __  __      _____  _ __| | _____
| | | `__| \ \ /\ / / _ \| `__| |/ / __|
| | | |     \ V  V / (_) | |  |   <\__ \
|_| |_|      \_/\_/ \___/|_|  |_|\_\___/

*/

&_init_;
proc r;
submit;
library(DBI)
library(odbc)

con <- dbConnect(odbc::odbc(),
    driver = "SQLite3 ODBC Driver",
    database = "d://sqlite//mydatabase.sqlite")

dbWriteTable(con, "carssql", cars, overwrite = TRUE)

cars_from_db <- dbReadTable(con, "carssql")
print("Cars from sqllite")
head(cars_from_db)

# Always disconnect when done
dbDisconnect(con)
endsubmit;
run;quit;

OUTPUT
======

Altair SLC

[1] "Cars from sqllite"
  speed dist
1     4    2
2     4   10
3     7    4
4     7   22
5     8   16
6     9   10

LOG
===

684
1685      dbWriteTable(con, "carssql", cars, overwrite = TRUE)
1686
1687      cars_from_db <- dbReadTable(con, "carssql")
1688      print("Cars from sqllite")
1689      head(cars_from_db)
1690
1691      # Always disconnect when done
1692      dbDisconnect(con)
1693      endsubmit;
NOTE: Using R version 4.5.1 (2025-06-13 ucrt) from d:\r451

NOTE: Submitting statements to R:

> library(DBI)
> library(odbc)
>
> con <- dbConnect(odbc::odbc(),
+     driver = "SQLite3 ODBC Driver",
+     database = "d://sqlite//mydatabase.sqlite")
>
> dbWriteTable(con, "carssql", cars, overwrite = TRUE)
>
> cars_from_db <- dbReadTable(con, "carssql")
> print("Cars from sqllite")
> head(cars_from_db)
>
> # Always disconnect when done

NOTE: Processing of R statements complete

> dbDisconnect(con)
1694      run;quit;
NOTE: Procedure r step took :
      real time : 1.351
      cpu time  : 0.000


1695      quit; run;
1696      ODS _ALL_ CLOSE;
1697      FILENAME WPSWBHTM CLEAR;

/*___        _         __       _ _           _
|___ \   ___| | ___   / _| __ _(_) |___    __| |___ _ __
  __) | / __| |/ __| | |_ / _` | | / __|  / _` / __| `_ \
 / __/  \__ \ | (__  |  _| (_| | | \__ \ | (_| \__ \ | | |
|_____| |___/_|\___| |_|  \__,_|_|_|___/  \__,_|___/_| |_|

*/

/*--- I do not have a password so I can show the connection string; ----*/

&_init_;
libname sqlite odbc complete="dsn=SQLite3 Datasource;Driver={SQLite3 ODBC Driver};Database=d:\sqlite\mydatabase.db";
data sqlite.delete;
  tst=2;
run;quit;

LOG
====

635      ODS _ALL_ CLOSE;
1636      FILENAME WPSWBHTM TEMP;
NOTE: Writing HTML(WBHTML) BODY file d:\wpswrk\_TD13688\#LN00091
1637      ODS HTML(ID=WBHTML) BODY=WPSWBHTM GPATH="d:\wpswrk\_TD13688";
1638      &_init_;
1639      libname sqlite odbc complete=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
NOTE: Library sqlite assigned as follows:
      Engine:        ODBC
      Physical Name: SQLite3 Datasource (SQLite version 3.43.2)

1640      data sqlite.delete;
1641        tst=2;
1642      run;

ERROR: A database error occurred. The database specific error follows:
       DB: HY000: near "delete": syntax error (1)

ERROR: DB thread 17 failed to execute the passthrough statement. A database error occurred: HY000: near "delete": syntax error (1)

NOTE: The data step took :
      real time : 0.005
      cpu time  : 0.015


1642    !     quit;
1643      quit; run;
1644      ODS _ALL_ CLOSE;
1645      FILENAME WPSWBHTM CLEAR;

/*____       _         __       _ _           _                      _        _
|___ /   ___| | ___   / _| __ _(_) |___    __| |_ ____   ___ __  ___| |_ _ __(_)_ __   __ _
  |_ \  / __| |/ __| | |_ / _` | | / __|  / _` | `__\ \ / / `__|/ __| __| `__| | `_ \ / _` |
 ___) | \__ \ | (__  |  _| (_| | | \__ \ | (_| | |   \ V /| |   \__ \ |_| |  | | | | | (_| |
|____/  |___/_|\___| |_|  \__,_|_|_|___/  \__,_|_|    \_/ |_|   |___/\__|_|  |_|_| |_|\__, |
                                                                                      |___/

*/

data delete;
 input x y;
cards4;
1 2
2 4
3 6
4 8
;;;;
run;quit;

&_init_;
PROC SQL;
  CONNECT TO ODBC (DSN=slite3);

  /* Create table with specific structure */
  EXECUTE (
    CREATE TABLE deletesql AS
    SELECT * FROM delete
  ) BY ODBC;

  DISCONNECT FROM ODBC;
QUIT;



1698      ODS _ALL_ CLOSE;
1699      FILENAME WPSWBHTM TEMP;
NOTE: Writing HTML(WBHTML) BODY file d:\wpswrk\_TD13688\#LN00094
1700      ODS HTML(ID=WBHTML) BODY=WPSWBHTM GPATH="d:\wpswrk\_TD13688";
1701      data delete;
1702       input x y;
1703      cards4;

NOTE: Data set "WORK.delete" has 4 observation(s) and 2 variable(s)
NOTE: The data step took :
      real time : 0.014
      cpu time  : 0.000


1704      1 2
1705      2 4
1706      3 6
1707      4 8
1708      ;;;;
1709      run;quit;
1710
1711      &_init_;
1712      PROC SQL;
1713        CONNECT TO ODBC (DSN=slite3);
ERROR: A database error occurred. The database specific error follows:
       DB: IM002: [Microsoft][ODBC Driver Manager] Data source name not found and no default driver specified

ERROR: Could not connect to DB
1714
1715        /* Create table with specific structure */
1716        EXECUTE (
1717          CREATE TABLE deletesql AS
1718          SELECT * FROM delete
1719        ) BY ODBC;
NOTE: ERRORSTOP was specified. The statement will not be executed due to an earlier error
1720
1721        DISCONNECT FROM ODBC;
NOTE: ERRORSTOP was specified. The statement will not be executed due to an earlier error
NOTE: Statements not executed because of errors detected
1722      QUIT;
NOTE: Procedure SQL step took :
      real time : 0.002
      cpu time  : 0.000


1723
1724      quit; run;
1725      ODS _ALL_ CLOSE;
1726      FILENAME WPSWBHTM CLEAR;

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
