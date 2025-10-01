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
   2 slc works

&_init_;
libname mydb odbc noprompt="Driver=SQLite3 ODBC Driver;Database=d:\sqlite\new.db;";

/*---- in case you rerun ----*/
proc sql;
  drop table mydb.class
;quit;

data mydb.class;
  set class;
run;quit;

proc print data=mydb.class;
run;quit;

libname mydb clear

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


/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
