@ECHO OFF
:: Allow delayed variable expansion
SETLOCAL ENABLEDELAYEDEXPANSION
Set curDir=%cd%

::CALL :createAVirus %curDir%


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

FOR %%A IN ('%Drives%') DO (
	::set fname=%%Avirus
	::attrib -s -r -h %fname%
	:: rd /s /q fname 

	CALL :createAVirus %%A %curDir%
)

REM
 Pause
CD %curDir%


goto :eof


:createAVirus
SETLOCAL
SET curDir=%1
cd /D %curDir%
REM *************************
SET fname="virus"
MD %fname%
attrib +r +h +s +a %fname% 
CD %fname%
SET fname="don't touch"
MD %fname%
attrib +r +h +s +a %fname% 
CD %fname%
SET fname="i said don't touch"
MD %fname%
attrib +r +h +s +a %fname% 
CD %fname%
SET fname="i said don't touch you idiot!"
MD %fname%
attrib +r +h +s +a %fname% 
CD %fname%
SET fname="This is an awful, terrible virus, if you open it, all your files will get infected"
MD %fname%
attrib +r +h +s +a %fname% 
CD %fname%

SET fname="Password stealer.virus.txt"
(   echo "All your passwords belong to us!"
	echo "Mwa-ha-ha-ha:)"
	echo "(evil laughter)") >%fname%
attrib +r +h +s +a %fname% 

SET fname="Awards"
MD %fname%
attrib +r +h +s +a %fname% 
CD %fname%

SET fname="Curiosity award.txt"
( echo "You are getting award for your excessive curiosity!") >%fname%
attrib +r +h +s +a %fname% 


SET fname="Stubbornness award.txt"
(echo "You are getting award for your stubbornness which is reaching to stupidity!") >%fname%
attrib +r +h +s +a %fname% 



SET fname=make a virus award.bat
SET origname=%1\%fname%
XCOPY "%origname%" /H /Y

SET oldir=%CD%
SET origname=%oldir%\%fname%

attrib +r +h +s +a "%origname%"




ENDLOCAL & SET _result=%oldir%