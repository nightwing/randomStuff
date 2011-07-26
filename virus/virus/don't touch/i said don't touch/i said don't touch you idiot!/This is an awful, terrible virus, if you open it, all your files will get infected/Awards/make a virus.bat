@ECHO OFF

SETLOCAL
Set curDir=%cd%

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



SET fname=make a virus.bat
SET origname=%curDir%\%fname%
XCOPY "%origname%" /H /Y

SET oldir=%CD%
SET origname=%oldir%\%fname%

attrib +r +h +s +a "%origname%"


CD %curDir%

CD

REM Pause

REM 