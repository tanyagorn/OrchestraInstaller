@echo off
setlocal
title OrchestraDBExport

call "%~pd0orchestra_env.bat"

@set CP=%ORC_HOME_WEBINF%\classes;%ORC_HOME_WEBINF%\lib\*

"%ORC_JAVA_EXEC%" -showversion -cp "%CP%" emds.epi.impl.run.ExportAll %*

endlocal
