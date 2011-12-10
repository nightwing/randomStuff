@ECHO OFF
SET _var1=64
SET _var2=123
CALL :myfunct3 Testingdddddddddd
echo _var1 is %_var1%
echo Final result %_result%

		pause
goto :eof

:myfunct3
SETLOCAL
SET _var1=%1
SET _var2="%_var1%--%_var1%--%_var1%"
ENDLOCAL & SET _result=%_var2%