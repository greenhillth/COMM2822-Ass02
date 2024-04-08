# build final table script from files in build folder
Get-Content init\*.sql | Set-Content final\initDB.sql
Get-Content build\*.sql | Set-Content final\createtables.sql
Get-Content alter\*.sql | Set-Content final\altertables.sql
Get-Content procedures\*.sql | Set-Content final\procedures.sql