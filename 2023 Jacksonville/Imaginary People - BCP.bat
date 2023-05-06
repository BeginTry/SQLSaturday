TITLE "%~n0"
ECHO OFF
COLOR 0E
REM CLS

bcp tempdb.guest.ImaginaryPeople in "ImaginaryPeople.csv" -S .\SQL2019 -T -c -t, -r "\n" -F 2
REM "C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\130\Tools\Binn\bcp.exe" tempdb.guest.ImaginaryPeople in "C:\Output\ImaginaryPeople.csv" -S .\SQL2019 -T -c -t, -r "\n" -F 2
REM "C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\170\Tools\Binn\bcp.exe" tempdb.guest.ImaginaryPeople in "C:\Output\ImaginaryPeople.csv" -S .\SQL2019 -T -c -t, -r "\n" -F 2

pause