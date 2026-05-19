@echo off
:: Extract date (YYYYMMDD) and time (HHMM) in a safe format
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set datetime=%%I

set "YYYY=%datetime:~0,4%"
set "MM=%datetime:~4,2%"
set "DD=%datetime:~6,2%"
set "HH=%datetime:~8,2%"
set "Min=%datetime:~10,2%"

:: Combine into a prefix (e.g., 2026-05-19_0721_)
set "prefix=%YYYY%-%MM%-%DD%_%HH%%Min%_"

:: Generate the report on your Desktop
powercfg /batteryreport /output "%USERPROFILE%\Desktop\%prefix%battery_report.html"

echo.
echo Battery report generated: %prefix%battery_report.html
pause