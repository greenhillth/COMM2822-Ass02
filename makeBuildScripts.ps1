# build final table script from files in build folder
Set-ItemProperty -Path final\a_initDB.sql -Name IsReadOnly -Value $false
Get-Content init\header.txt, init\*.sql, init\footer.txt | Set-Content final\a_initDB.sql
Set-ItemProperty -Path final\a_initDB.sql -Name IsReadOnly -Value $true

Set-ItemProperty -Path final\b_createTables.sql -Name IsReadOnly -Value $false
Get-Content build\header.txt, build\*.sql, build\footer.txt | Set-Content final\b_createTables.sql
Set-ItemProperty -Path final\b_createTables.sql -Name IsReadOnly -Value $true

Set-ItemProperty -Path final\c_alterTables.sql -Name IsReadOnly -Value $false
Get-Content alter\header.txt, alter\*.sql, procedures\*.sql, alter\footer.txt | Set-Content final\c_alterTables.sql
Set-ItemProperty -Path final\c_alterTables.sql -Name IsReadOnly -Value $true

Set-ItemProperty -Path final\d_fillTables.sql -Name IsReadOnly -Value $false
Get-Content insert\header.txt, insert\*.sql, insert\footer.txt | Set-Content final\d_fillTables.sql
Set-ItemProperty -Path final\d_fillTables.sql -Name IsReadOnly -Value $true
