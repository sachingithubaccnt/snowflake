USE SCHEMA DEMO;
create or replace procedure Table_aggregate()
    returns float 
    not null
    language javascript
    as
    $$
    var row_count = 0;
     var sql_command = "insert into agreegate_table (color_name,color_code,year,amt) select max(color_name) clname,max(color_code),year,sum(amt) from test_table group by year";
     var stmt = snowflake.createStatement({sqlText: sql_command});
     var res = stmt.execute();
     res.next();
    row_count = res.getColumnValue(1);
    return row_count;
    $$
    ;
