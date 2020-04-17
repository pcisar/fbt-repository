set bail on;
create or alter procedure sp_gen_code returns(txt varchar(4000)) as begin end;
recreate table tdata(
   id int generated by default as identity constraint tdata_pk primary key
  ,inp_type varchar(30)
  ,inp_name varchar(31) default 'a'
  ,out_type varchar(30)
  ,out_name varchar(31) default 'b'
  ,sp_body varchar(255)
  ,inp_arg varchar(100)
);
commit;
------------------------

--/*
insert into tdata(inp_type, out_type, sp_body, inp_arg)
    select 'smallint',    'int'             , '[a]/3'   , '-0x8000' from rdb$database union all
    select 'smallint',    'int'             , '[a]/3'   , '0x7FFF' from rdb$database union all
    select 'smallint',    'bigint'          , '[a]/3'   , '0x7FFF' from rdb$database union all
    select 'smallint',    'float'           , '1608.90*[a]/100.00' , '5' from rdb$database union all
    select 'smallint',    'double precision', '1608.90*[a]/100.00' , '5' from rdb$database union all
    select 'smallint',    'decimal(10,4)'   , '1608.90*[a]/100.00' , '5' from rdb$database union all
    select 'smallint',    'numeric(10,4)'   , '1608.90*[a]/100.00' , '5' from rdb$database union all
    select 'smallint',    'decimal( 4,2)'   , '1608.90*[a]/100.00' , '5' from rdb$database union all
    select 'smallint',    'numeric( 4,2)'   , '1608.90*[a]/100.00' , '5' from rdb$database union all
    select 'smallint',    'date'            , 'date ''01.02.2003'' + [a]'   , '0x123' from rdb$database union all
    select 'smallint',    'time'            , 'time ''01:02:03'' + [a]'     , '0x124' from rdb$database union all
    select 'smallint',    'timestamp'       , 'timestamp ''01.02.2003 01:02:03'' + [a]' , '0x125' from rdb$database union all
    select 'smallint',    'blob'            , '1608.90*[a]/100.00' , '5' from rdb$database union all
    select 'smallint',    'char(10)'        , '1608.90*[a]/100.00' , '5' from rdb$database union all
    select 'smallint',    'nchar(10)'       , '1608.90*[a]/100.00' , '5' from rdb$database union all
    select 'smallint',    'varchar(10)'     , '1608.90*[a]/100.00' , '5' from rdb$database
;
--*/

--/*
insert into tdata(inp_type, out_type, sp_body, inp_arg)
    select 'int',    'smallint'        , '1608.90*[a]/100.00'   , '5' from rdb$database union all
    select 'int',    'bigint'          , '1608.90*[a]/100.00'   , '5'  from rdb$database union all
    select 'int',    'float'           , '1608.90*[a]/100.00'   , '5'  from rdb$database union all
    select 'int',    'double precision', '1608.90*[a]/100.00'   , '5'  from rdb$database union all
    select 'int',    'numeric(10,4)'   , '1608.90*[a]/100.00'   , '5'  from rdb$database union all -- BIGINT in dia-3 (data * 10^4)
    select 'int',    'decimal(10,4)'   , '1608.90*[a]/100.00'   , '5' from rdb$database union all -- BIGINT in dia-3 (data * 10^4)
    select 'int',    'numeric( 4,2)'   , '[a]/1000.00'   , '45' from rdb$database union all -- SMALLINT (data * 10^2)
    select 'int',    'decimal( 4,2)'   , '[a]/1000.00'   , '45' from rdb$database union all -- INTEGER (data * 10^2)
    select 'int',    'numeric( 4,2)'   , '[a]/1000.00'   , '55' from rdb$database union all -- SMALLINT (data * 10^2)
    select 'int',    'decimal( 4,2)'   , '[a]/1000.00'   , '55' from rdb$database union all -- INTEGER (data * 10^2)

    select 'int',    'date'            , 'date ''01.02.2003'' + 1608.90*[a]/100'   , '5' from rdb$database union all
    select 'int',    'time'            , 'time ''01:02:03'' + [a]/1000'     , '45' from rdb$database union all
    select 'int',    'timestamp'       , 'timestamp ''01.02.2003 01:02:03'' + 1608.90*[a]/100' , '5' from rdb$database union all
    select 'int',    'blob'            , '1608.90*[a]/100.00'   , '5' from rdb$database union all
    select 'int',    'char(10)'        , '1608.90*[a]/100.00'   , '5' from rdb$database union all
    select 'int',    'nchar(10)'       , '1608.90*[a]/100.00'   , '5' from rdb$database union all
    select 'int',    'varchar(10)'     , '1608.90*[a]/100.00'   , '5' from rdb$database
;
--*/

--/*
insert into tdata(inp_type, out_type, sp_body, inp_arg)
    select 'bigint',    'smallint'        , '1608.90*[a]/100.00'   , '5' from rdb$database union all
    select 'bigint',    'bigint'          , '1608.90*[a]/100.00'   , '5'  from rdb$database union all
    select 'bigint',    'float'           , '1608.90*[a]/100.00'   , '5'  from rdb$database union all
    select 'bigint',    'double precision', '1608.90*[a]/100.00'   , '5'  from rdb$database union all
    select 'bigint',    'numeric(10,4)'   , '1608.90*[a]/100.00'   , '5'  from rdb$database union all -- BIGINT in dia-3 (data * 10^4)
    select 'bigint',    'decimal(10,4)'   , '1608.90*[a]/100.00'   , '5' from rdb$database union all -- BIGINT in dia-3 (data * 10^4)
    select 'bigint',    'numeric( 4,2)'   , '[a]/1000.00'   , '45' from rdb$database union all -- SMALLINT (data * 10^2)
    select 'bigint',    'decimal( 4,2)'   , '[a]/1000.00'   , '45' from rdb$database union all -- INTEGER (data * 10^2)
    select 'bigint',    'numeric( 4,2)'   , '[a]/1000.00'   , '55' from rdb$database union all -- SMALLINT (data * 10^2)
    select 'bigint',    'decimal( 4,2)'   , '[a]/1000.00'   , '55' from rdb$database union all -- INTEGER (data * 10^2)

    select 'bigint',    'date'            , 'date ''01.02.2003'' + 1608.90*[a]/100'   , '5' from rdb$database union all
    select 'bigint',    'time'            , 'time ''01:02:03'' + [a]/1000'     , '45' from rdb$database union all
    select 'bigint',    'timestamp'       , 'timestamp ''01.02.2003 01:02:03'' + 1608.90*[a]/100' , '5' from rdb$database union all
    select 'bigint',    'blob'            , '1608.90*[a]/100.00'   , '5' from rdb$database union all
    select 'bigint',    'char(10)'        , '1608.90*[a]/100.00'   , '5' from rdb$database union all
    select 'bigint',    'nchar(10)'       , '1608.90*[a]/100.00'   , '5' from rdb$database union all
    select 'bigint',    'varchar(10)'     , '1608.90*[a]/100.00'   , '5' from rdb$database
;
--*/

--/*
insert into tdata(inp_type, out_type, sp_body, inp_arg)
    select 'float',    'int'             , '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'float',    'bigint'          , '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'float',    'smallint'        , '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'float',    'double precision', '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'float',    'numeric(10,4)'   , '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all -- BIGINT in dia-3 (data * 10^4)
    select 'float',    'numeric( 4,2)'   , '[a]'   , '0.045' from rdb$database union all -- SMALLINT (data * 10^2)
    select 'float',    'decimal(10,4)'   , '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all -- BIGINT in dia-3 (data * 10^4)
    select 'float',    'decimal(4,2)'    , '[a]'   , '0.045' from rdb$database union all -- INTEGER (data * 10^2)
    select 'float',    'date'            , 'date ''01.02.2003'' + [a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'float',    'time'            , 'time ''01:02:03'' + [a]'     , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'float',    'timestamp'       , 'timestamp ''01.02.2003 01:02:03'' + [a]' , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'float',    'blob'            , '[a]'     , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'float',    'char(10)'        , '[a]'     , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'float',    'nchar(10)'       , '[a]'     , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'float',    'varchar(10)'     , '[a]'     , '1608.90 * 5.00 / 100.00' from rdb$database
;
--*/

--/*
insert into tdata(inp_type, out_type, sp_body, inp_arg)
    select 'double precision',    'int'             , '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'double precision',    'bigint'          , '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'double precision',    'smallint'        , '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'double precision',    'float'           , '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'double precision',    'numeric(10,4)'   , '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all -- BIGINT in dia-3 (data * 10^4)
    select 'double precision',    'decimal(10,4)'   , '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all -- BIGINT in dia-3 (data * 10^4)
    select 'double precision',    'numeric(4,2)'    , '[a]'   , '0.045' from rdb$database union all -- SMALLINT (data * 10^2)
    select 'double precision',    'decimal(4,2)'    , '[a]'   , '0.045' from rdb$database union all -- INTEGER (data * 10^2)
    select 'double precision',    'numeric(4,2)'    , '[a]'   , '0.055' from rdb$database union all -- SMALLINT (data * 10^2)
    select 'double precision',    'decimal(4,2)'    , '[a]'   , '0.055' from rdb$database union all -- INTEGER (data * 10^2)
    select 'double precision',    'numeric(4,2)'    , '[a]'   , '0.075' from rdb$database union all -- SMALLINT (data * 10^2)
    select 'double precision',    'decimal(4,2)'    , '[a]'   , '0.075' from rdb$database union all -- INTEGER (data * 10^2)
    select 'double precision',    'date'            , 'date ''01.02.2003'' + [a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'double precision',    'time'            , 'time ''01:02:03'' + [a]'     , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'double precision',    'timestamp'       , 'timestamp ''01.02.2003 01:02:03'' + [a]' , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'double precision',    'blob'            , '[a]'     , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'double precision',    'char(10)'        , '[a]'     , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'double precision',    'nchar(10)'       , '[a]'     , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'double precision',    'varchar(10)'     , '[a]'     , '1608.90 * 5.00 / 100.00' from rdb$database
;
--*/

--/*
insert into tdata(inp_type, out_type, sp_body, inp_arg)
    select 'numeric(4,2)',    'smallint'        , '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'numeric(4,2)',    'int'             , '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'numeric(4,2)',    'bigint'          , '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'numeric(4,2)',    'float'           , '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'numeric(4,2)',    'double precision', '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all -- BIGINT in dia-3 (data * 10^4)
    select 'numeric(4,2)',    'float'           , '[a]'   , '0.045' from rdb$database union all
    select 'numeric(4,2)',    'double precision', '[a]'   , '0.045' from rdb$database union all -- BIGINT in dia-3 (data * 10^4)
    select 'numeric(4,2)',    'float'           , '[a]'   , '0.055' from rdb$database union all
    select 'numeric(4,2)',    'double precision', '[a]'   , '0.055' from rdb$database union all -- BIGINT in dia-3 (data * 10^4)
    select 'numeric(4,2)',    'float'           , '[a]'   , '0.075' from rdb$database union all
    select 'numeric(4,2)',    'double precision', '[a]'   , '0.075' from rdb$database union all -- BIGINT in dia-3 (data * 10^4)
    select 'numeric(4,2)',    'numeric(4,2)'    , '[a]'   , '0.045' from rdb$database union all -- SMALLINT (data * 10^2)
    select 'numeric(4,2)',    'decimal(4,2)'    , '[a]'   , '0.045' from rdb$database union all -- INTEGER (data * 10^2)
    select 'numeric(4,2)',    'numeric(4,2)'    , '[a]'   , '0.055' from rdb$database union all -- SMALLINT (data * 10^2)
    select 'numeric(4,2)',    'decimal(4,2)'    , '[a]'   , '0.055' from rdb$database union all -- INTEGER (data * 10^2)
    select 'numeric(4,2)',    'numeric(4,2)'    , '[a]'   , '0.075' from rdb$database union all -- SMALLINT (data * 10^2)
    select 'numeric(4,2)',    'decimal(4,2)'    , '[a]'   , '0.075' from rdb$database union all -- INTEGER (data * 10^2)
    select 'numeric(4,2)',    'date'            , 'date ''01.02.2003'' + [a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'numeric(4,2)',    'time'            , 'time ''01:02:03'' + [a]'     , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'numeric(4,2)',    'timestamp'       , 'timestamp ''01.02.2003 01:02:03'' + [a]' , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'numeric(4,2)',    'blob'            , '[a]'     , '0.045' from rdb$database union all
    select 'numeric(4,2)',    'char(10)'        , '[a]'     , '0.045' from rdb$database union all
    select 'numeric(4,2)',    'nchar(10)'       , '[a]'     , '0.045' from rdb$database union all
    select 'numeric(4,2)',    'varchar(10)'     , '[a]'     , '0.045' from rdb$database union all
    select 'numeric(4,2)',    'blob'            , '[a]'     , '0.055' from rdb$database union all
    select 'numeric(4,2)',    'char(10)'        , '[a]'     , '0.055' from rdb$database union all
    select 'numeric(4,2)',    'nchar(10)'       , '[a]'     , '0.055' from rdb$database union all
    select 'numeric(4,2)',    'varchar(10)'     , '[a]'     , '0.055' from rdb$database union all
    select 'numeric(4,2)',    'blob'            , '[a]'     , '0.075' from rdb$database union all
    select 'numeric(4,2)',    'char(10)'        , '[a]'     , '0.075' from rdb$database union all
    select 'numeric(4,2)',    'nchar(10)'       , '[a]'     , '0.075' from rdb$database union all
    select 'numeric(4,2)',    'varchar(10)'     , '[a]'     , '0.075' from rdb$database
;
--*/


--/*
insert into tdata(inp_type, out_type, sp_body, inp_arg)
    select 'decimal(4,2)',    'smallint'        , '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'decimal(4,2)',    'int'             , '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'decimal(4,2)',    'bigint'          , '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'decimal(4,2)',    'float'           , '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'decimal(4,2)',    'double precision', '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all -- BIGINT in dia-3 (data * 10^4)
    select 'decimal(4,2)',    'float'           , '[a]'   , '0.045' from rdb$database union all
    select 'decimal(4,2)',    'double precision', '[a]'   , '0.045' from rdb$database union all -- BIGINT in dia-3 (data * 10^4)
    select 'decimal(4,2)',    'float'           , '[a]'   , '0.055' from rdb$database union all
    select 'decimal(4,2)',    'double precision', '[a]'   , '0.055' from rdb$database union all -- BIGINT in dia-3 (data * 10^4)
    select 'decimal(4,2)',    'float'           , '[a]'   , '0.075' from rdb$database union all
    select 'decimal(4,2)',    'double precision', '[a]'   , '0.075' from rdb$database union all -- BIGINT in dia-3 (data * 10^4)
    select 'decimal(4,2)',    'numeric(4,2)'    , '[a]'   , '0.045' from rdb$database union all -- SMALLINT (data * 10^2)
    select 'decimal(4,2)',    'decimal(4,2)'    , '[a]'   , '0.045' from rdb$database union all -- INTEGER (data * 10^2)
    select 'decimal(4,2)',    'numeric(4,2)'    , '[a]'   , '0.055' from rdb$database union all -- SMALLINT (data * 10^2)
    select 'decimal(4,2)',    'decimal(4,2)'    , '[a]'   , '0.055' from rdb$database union all -- INTEGER (data * 10^2)
    select 'decimal(4,2)',    'numeric(4,2)'    , '[a]'   , '0.075' from rdb$database union all -- SMALLINT (data * 10^2)
    select 'decimal(4,2)',    'decimal(4,2)'    , '[a]'   , '0.075' from rdb$database union all -- INTEGER (data * 10^2)
    select 'decimal(4,2)',    'date'            , 'date ''01.02.2003'' + [a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'decimal(4,2)',    'time'            , 'time ''01:02:03'' + [a]'     , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'decimal(4,2)',    'timestamp'       , 'timestamp ''01.02.2003 01:02:03'' + [a]' , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'decimal(4,2)',    'blob'            , '[a]'     , '0.045' from rdb$database union all
    select 'decimal(4,2)',    'char(10)'        , '[a]'     , '0.045' from rdb$database union all
    select 'decimal(4,2)',    'nchar(10)'       , '[a]'     , '0.045' from rdb$database union all
    select 'decimal(4,2)',    'varchar(10)'     , '[a]'     , '0.045' from rdb$database union all
    select 'decimal(4,2)',    'blob'            , '[a]'     , '0.055' from rdb$database union all
    select 'decimal(4,2)',    'char(10)'        , '[a]'     , '0.055' from rdb$database union all
    select 'decimal(4,2)',    'nchar(10)'       , '[a]'     , '0.055' from rdb$database union all
    select 'decimal(4,2)',    'varchar(10)'     , '[a]'     , '0.055' from rdb$database union all
    select 'decimal(4,2)',    'blob'            , '[a]'     , '0.075' from rdb$database union all
    select 'decimal(4,2)',    'char(10)'        , '[a]'     , '0.075' from rdb$database union all
    select 'decimal(4,2)',    'nchar(10)'       , '[a]'     , '0.075' from rdb$database union all
    select 'decimal(4,2)',    'varchar(10)'     , '[a]'     , '0.075' from rdb$database
;
--*/

--/*

insert into tdata(inp_type, out_type, sp_body, inp_arg)
    select 'date',    'smallint'        , '[a]-date ''29.02.2000'''   , '''29.02.2004''' from rdb$database union all
    select 'date',    'int'             , '[a]-date ''29.02.1600'''   , '''29.02.2004''' from rdb$database union all
    select 'date',    'bigint'          , '[a]-date ''29.02.1600'''   , '''29.02.2004''' from rdb$database union all
    select 'date',    'float'           , 'cast( ''TOMORROW'' as date) + ([a] - cast(''YESTERDAY'' as date) ) - [a]' , '''29.02.2004''' from rdb$database union all
    select 'date',    'double precision', 'cast( ''TOMORROW'' as date) + ([a] - cast(''YESTERDAY'' as date) ) - [a]' , '''29.02.2004''' from rdb$database union all
    select 'date',    'numeric(4,2)'    , 'cast( ''TOMORROW'' as date) + ([a] - cast(''YESTERDAY'' as date) ) - [a]' , '''29.02.2004''' from rdb$database union all
    select 'date',    'decimal(4,2)'    , 'cast( ''TOMORROW'' as date) + ([a] - cast(''YESTERDAY'' as date) ) - [a]' , '''29.02.2004''' from rdb$database union all
    select 'date',    'time'            , 'time ''01:02:03'' + (cast(''TOMORROW'' as date) + ([a] - cast(''YESTERDAY'' as date)) - [a])'     , '''29.02.2004''' from rdb$database union all
    select 'date',    'timestamp'       , 'timestamp ''01.02.2003 01:02:03'' + ( cast(''TOMORROW'' as date) + ([a] - cast(''YESTERDAY'' as date)) - [a])' , '''29.02.2004''' from rdb$database union all
    select 'date',    'blob'            , '[a]'     , '''29.02.2004''' from rdb$database union all
    select 'date',    'char(10)'        , '[a]'     , '''29.02.2004''' from rdb$database union all
    select 'date',    'nchar(10)'       , '[a]'     , '''29.02.2004''' from rdb$database union all
    select 'date',    'varchar(10)'     , '[a]'     , '''29.02.2004''' from rdb$database
;

--*/

--/*
insert into tdata(inp_type, out_type, sp_body, inp_arg)
    select 'time',    'smallint'        , '[a]-time ''10:11:13.123'''   , '''11:12:13.789''' from rdb$database union all
    select 'time',    'int'             , '[a]-time ''01:02:03.123'''   , '''23:59:59.789''' from rdb$database union all
    select 'time',    'bigint'          , '[a]-time ''01:02:03.123'''   , '''23:59:59.789''' from rdb$database union all
    select 'time',    'float'           , '[a]-time ''01:02:03.123'''   , '''23:59:59.789''' from rdb$database union all
    select 'time',    'double precision', '[a]-time ''01:02:03.123'''   , '''23:59:59.789''' from rdb$database union all
    select 'time',    'numeric(10,2)'   , '[a]-time ''01:02:03.123'''   , '''23:59:59.789''' from rdb$database union all
    select 'time',    'decimal(10,2)'   , '[a]-time ''01:02:03.123'''   , '''23:59:59.789''' from rdb$database union all
    select 'time',    'date'            , 'current_date + [a] - datediff(day from date ''01.02.2003'' to current_date);' , '''01:02:03''' from rdb$database union all
    select 'time',    'timestamp'       , 'date ''01.02.2003'' + [a]' , '''01:02:03''' from rdb$database union all
    select 'time',    'blob'            , '[a]'     , '''01:02:03''' from rdb$database union all
    select 'time',    'char(13)'        , '[a]'     , '''01:02:03''' from rdb$database union all
    select 'time',    'nchar(13)'       , '[a]'     , '''01:02:03''' from rdb$database union all
    select 'time',    'varchar(13)'     , '[a]'     , '''01:02:03''' from rdb$database
;
--*/

--/*
insert into tdata(inp_type, out_type, sp_body, inp_arg)
    select 'timestamp',    'smallint'        , '[a]-timestamp ''29.02.2004 10:11:13.123'''   , '''29.02.2004 11:12:13.789''' from rdb$database union all
    select 'timestamp',    'int'             , '[a]-timestamp ''29.02.2004 10:11:13.123'''   , '''29.02.2004 23:59:59.789''' from rdb$database union all
    select 'timestamp',    'bigint'          , '[a]-timestamp ''29.02.2004 10:11:13.123'''   , '''29.02.2004 23:59:59.789''' from rdb$database union all
    select 'timestamp',    'float'           , '[a]-timestamp ''29.02.2004 10:11:13.123'''   , '''29.02.2004 23:59:59.789''' from rdb$database union all
    select 'timestamp',    'double precision', '[a]-timestamp ''29.02.2004 10:11:13.123'''   , '''29.02.2004 23:59:59.789''' from rdb$database union all
    select 'timestamp',    'numeric(10,2)'   , '[a]-timestamp ''29.02.2004 10:11:13.123'''   , '''29.02.2004 23:59:59.789''' from rdb$database union all
    select 'timestamp',    'decimal(10,2)'   , '[a]-timestamp ''29.02.2004 10:11:13.123'''   , '''29.02.2004 23:59:59.789''' from rdb$database union all
    select 'timestamp',    'date'            , '[a]'     , '''29.02.2004 01:02:03''' from rdb$database union all
    select 'timestamp',    'time'            , '[a]'     , '''29.02.2004 01:02:03''' from rdb$database union all
    select 'timestamp',    'blob'            , '[a]'     , '''29.02.2004 01:02:03.456''' from rdb$database union all
    select 'timestamp',    'char(30)'        , '[a]'     , '''29.02.2004 01:02:03.456''' from rdb$database union all
    select 'timestamp',    'nchar(30)'       , '[a]'     , '''29.02.2004 01:02:03.456''' from rdb$database union all
    select 'timestamp',    'varchar(30)'     , '[a]'     , '''29.02.2004 01:02:03.456''' from rdb$database
;
--*/

--/*
insert into tdata(inp_type, out_type, sp_body, inp_arg)
    select 'blob',    'boolean'         , '[a]'   , 'q''{true}''' from rdb$database union all
    select 'blob',    'smallint'        , '[a]'   , '''0x7fff''' from rdb$database union all
    select 'blob',    'int'             , '[a]'   , '''0x80000000''' from rdb$database union all
    select 'blob',    'bigint'          , '[a]'   , '''0x7fffffffffffffff''' from rdb$database union all
    select 'blob',    'float'           , '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'blob',    'double precision', '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'blob',    'numeric(5,2)'    , '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'blob',    'decimal(5,2)'    , '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'blob',    'date'            , '[a]'   , '''29.02.2004''' from rdb$database union all
    select 'blob',    'time'            , '[a]'   , '''01:02:03.456''' from rdb$database union all
    select 'blob',    'char(30)'        , '[a]'   , '0x123456789abcedf' from rdb$database union all
    select 'blob',    'nchar(30)'       , '[a]'   , '0x123456789abcedf' from rdb$database union all
    select 'blob',    'varchar(30)'     , '[a]'   , '0x123456789abcedf' from rdb$database
;
--*/

--/*
insert into tdata(inp_type, out_type, sp_body, inp_arg)
    select 'char(30)',    'boolean'         , '[a]'   , 'q''{true}''' from rdb$database union all
    select 'char(30)',    'smallint'        , '[a]'   , '0x7fff' from rdb$database union all
    select 'char(30)',    'int'             , '[a]'   , '0x80000000' from rdb$database union all
    select 'char(30)',    'bigint'          , '[a]'   , '0x7fffffffffffffff' from rdb$database union all
    select 'char(30)',    'float'           , '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'char(30)',    'double precision', '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'char(30)',    'numeric(5,2)'    , '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'char(30)',    'decimal(5,2)'    , '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'char(30)',    'date'            , '[a]'   , '''29.02.2004''' from rdb$database union all
    select 'char(30)',    'time'            , '[a]'   , '''01:02:03.456''' from rdb$database union all
    select 'char(30)',    'blob'            , '[a]'   , '0x123456789abcedf' from rdb$database union all
    select 'char(30)',    'nchar(30)'       , '[a]'   , '0x123456789abcedf' from rdb$database union all
    select 'char(30)',    'varchar(30)'     , '[a]'   , '0x123456789abcedf' from rdb$database
;
--*/

--/*
insert into tdata(inp_type, out_type, sp_body, inp_arg)
    select 'nchar(30)',    'boolean'         , '[a]'   , 'q''{true}''' from rdb$database union all
    select 'nchar(30)',    'smallint'        , '[a]'   , '0x7fff' from rdb$database union all
    select 'nchar(30)',    'int'             , '[a]'   , '0x80000000' from rdb$database union all
    select 'nchar(30)',    'bigint'          , '[a]'   , '0x7fffffffffffffff' from rdb$database union all
    select 'nchar(30)',    'float'           , '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'nchar(30)',    'double precision', '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'nchar(30)',    'numeric(5,2)'    , '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'nchar(30)',    'decimal(5,2)'    , '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'nchar(30)',    'date'            , '[a]'   , '''29.02.2004''' from rdb$database union all
    select 'nchar(30)',    'time'            , '[a]'   , '''01:02:03.456''' from rdb$database union all
    select 'nchar(30)',    'blob'            , '[a]'   , '0x123456789abcedf' from rdb$database union all
    select 'nchar(30)',    'char(30)'        , '[a]'   , '0x123456789abcedf' from rdb$database union all
    select 'nchar(30)',    'varchar(30)'     , '[a]'   , '0x123456789abcedf' from rdb$database
;
--*/

insert into tdata(inp_type, out_type, sp_body, inp_arg)
    select 'varchar(30)',    'boolean'         , '[a]'   , 'q''{true}''' from rdb$database union all
    select 'varchar(30)',    'smallint'        , '[a]'   , '0x7fff' from rdb$database union all
    select 'varchar(30)',    'int'             , '[a]'   , '0x80000000' from rdb$database union all
    select 'varchar(30)',    'bigint'          , '[a]'   , '0xf0000000' from rdb$database union all
    select 'varchar(30)',    'bigint'          , '[a]'   , '0x0f0000000' from rdb$database union all
    select 'varchar(30)',    'bigint'          , '[a]'   , '0x7fffffffffffffff' from rdb$database union all
    select 'varchar(30)',    'bigint'          , '[a]'   , '0xffffffffffffffff' from rdb$database union all
    select 'varchar(30)',    'float'           , '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'varchar(30)',    'double precision', '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'varchar(30)',    'numeric(5,2)'    , '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'varchar(30)',    'decimal(5,2)'    , '[a]'   , '1608.90 * 5.00 / 100.00' from rdb$database union all
    select 'varchar(30)',    'date'            , '[a]'   , '''29.02.2004''' from rdb$database union all
    select 'varchar(30)',    'time'            , '[a]'   , '''01:02:03.456''' from rdb$database union all
    select 'varchar(30)',    'blob'            , '[a]'   , '0x123456789abcedf' from rdb$database union all
    select 'varchar(30)',    'char(30)'        , '[a]'   , '0x123456789abcedf' from rdb$database union all
    select 'varchar(30)',    'nchar(30)'       , '[a]'   , '0x123456789abcedf' from rdb$database
;


--##############################################################################

update tdata d set d.out_name = 'blob_id' where d.out_name is distinct from 'blob_id' and d.out_type='blob';
update tdata d set sp_body = out_name || ' = ' || replace(sp_body, '[a]', inp_name);
commit;

set term ^;
create or alter procedure sp_gen_code returns(txt varchar(4000)) as
    declare v_lf char(1);
    declare v_spnm varchar(100);
    declare v_spbk varchar(31);
begin
    v_lf = ascii_char(10);
    txt = 'set heading off; set blob all;';
    suspend;

    for
        select inp_type, inp_name, out_type, out_name, sp_body, inp_arg, row_number()over(partition by inp_type, out_type, sp_body order by id) rn
        from tdata d
        as cursor c
    do begin
        v_spnm = '"' || right( trim(c.inp_type) || '_' || trim(c.out_type), 29) || '"';
        if (c.rn=1) then
        begin
            txt = ''
                || v_lf || 'set term ^;'
                || v_lf || 'create or alter procedure ' || v_spnm || ' ( '|| trim(c.inp_name) || ' ' || trim(c.inp_type) || ' )'
                || v_lf || 'returns ( ' || trim(c.out_name) || ' ' || trim(c.out_type) || ' ) as'
                || v_lf || 'begin'
                || v_lf || '    ' || trim(c.sp_body) || iif(  right( trim(c.sp_body) ,1) = ';', '',  ';' )
                || v_lf || '    suspend;'
                || v_lf || 'end^'
                || v_lf || 'set term ;^'
                || v_lf || 'commit;'
            ;
            suspend;
        end

        if ( c.out_name = 'blob_id' ) then
            txt = 'set list on; select p.'|| trim(c.out_name) || ' from ' || v_spnm || '(' || trim(c.inp_arg) ||') p; set list off; -- ' || c.rn  ;
        else
            txt = 'set list on; select p.'|| trim(c.out_name) || ' as ' || v_spnm || ' from ' || v_spnm || '(' || trim(c.inp_arg) ||') p; set list off; -- ' || c.rn  ;

        suspend;
        v_spbk = v_spnm;
    end

    if ( v_spbk is not null ) then
    begin
        txt = 'commit;'
              || v_lf || ''
        ;
        suspend;
    end

end
^
set term ;^
commit;

-- set heading off;
set bail off;
set list on;
select txt as " " from sp_gen_code;
commit;
