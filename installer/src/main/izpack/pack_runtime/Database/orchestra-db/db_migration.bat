REM @echo off
setlocal

cmd /c "cd %1"
cmd /c "mvn compile flyway:migrate"

endlocal