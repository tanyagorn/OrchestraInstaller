@echo off
setlocal
title OrchestraGenPasswd

call "%~pd0orchestra_env.bat"

@set CP=%ORC_HOME_WEBINF%\classes;%ORC_HOME_WEBINF%\lib\*

"%ORC_JAVA_EXEC%" -showversion -cp "%CP%" emds.epi.impl.security.TwoWayPassword %*

endlocal
