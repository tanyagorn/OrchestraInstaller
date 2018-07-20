REM @echo off
setlocal

cmd /c "cd %1"
cmd /c "flyway clean migrate"

endlocal