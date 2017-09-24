@IF EXIST Config.bat (
	@CALL Config.bat
) ELSE (
	@ECHO Config.bat not found
	@ECHO Please call Setup.bat and provide it with the path to your avrdude.exe
	@GOTO :end
)

@SETLOCAL

@IF [%1] == [] (
	@SET /p comport=COM port: 
) ELSE (
	@SET comport=%1
)

@IF [%2] == [] (
	@SET /p hexfile=.hex file: 
) ELSE (
	@SET hexfile=%2
)

@IF NOT EXIST %comport% (
	@ECHO Invalid COM port
	@GOTO :end
)

@IF NOT EXIST %hexfile% (
	@ECHO Hex file not found
	@GOTO :end
)

@ECHO Uploading %hexfile% on %comport%
@%avrdudepath% -v -patmega32u4 -cavr109 -P%comport% -b57600 -D -Uflash:w:"%hexfile%":i

@ENDLOCAL

:end
@SET "avrdudepath="