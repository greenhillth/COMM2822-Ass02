# build final table script from files in build folder
Get-Content build\*.sql | Set-Content final\createtables.sql