REM @echo off
setlocal
title OrchestraDesigner

call "%~pd0orchestra_env.bat"

@set CP=%ORC_HOME_WEBINF%\classes;%ORC_HOME_WEBINF%\lib\*;%ORC_HOME%\lib_designer\*

"%ORC_JAVA_EXEC%" -showversion -Xmx256M -cp "%CP%" emds.epi.graph.EPIEditor %*

endlocal
