@ECHO OFF
ECHO.

:: Check OS version (Windows XP or later)
IF NOT "%OS%"=="Windows_NT"       GOTO Syntax
VER | FIND "Windows NT"   >NUL && GOTO Syntax
VER | FIND "Windows 2000" >NUL && GOTO Syntax

:: Check command line arguments (none required)
IF NOT  "%~1"=="" GOTO Syntax

:: Allow delayed variable expansion
SETLOCAL ENABLEDELAYEDEXPANSION
SET Available=
SET Drives=

:: The main command to list all drive letters in use is FSUTIL FSINFO DRIVES.
:: MORE /E /T0 removes the vertical tabs/single linefeeds from FSUTIL's output,
:: which is necessary to allow parsing with FOR /F.
FOR /F "tokens=1,2 delims=\ " %%A IN ('FSUTIL FSINFO DRIVES ^| MORE /E /T0') DO (
	IF "%%B"=="" (
		SET Drives=!Drives! %%A
	) ELSE (
		SET Drives=%%B
	)
)
:: Display the formated result
ECHO Drive letters in use      %Drives%

:: Check which drive letters are not in use
FOR %%A IN (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) DO (
	ECHO.%Drives% | FIND "%%A:" >NUL
	IF ERRORLEVEL 1 (
		IF "!Available!"=="" (
			SET Available=%%A:
		) ELSE (
			SET Available=!Available! %%A:
		)
	)
)
:: Display the formated result
ECHO Available drive letters   %Available%

:: "Export" the 2 variables and terminate
ENDLOCAL & SET Drives=%Drives%& SET Available=%Available%
GOTO:EOF


:Syntax
ECHO DrivUsed.bat,  Version 1.00 for Windows XP and later
ECHO List used and available drive letters
ECHO.
ECHO Usage:  DRIVUSED
ECHO.
ECHO Note:   The list of drive letters in use is displayed on screen
ECHO         and stored in an environment variable named "Drives".
ECHO         The list of available drive letters is displayed on screen
ECHO         and stored in an environment variable named "Available".
ECHO.
ECHO Written by Rob van der Woude
ECHO http://www.robvanderwoude.com
