@IF [%1] == [] (
	@GOTO :usage
)

@IF [%2] == [] (
	@GOTO :usage
)

@SETLOCAL
@IF EXIST Config.bat (
	@CALL Config.bat
	@IF EXIST %1 (
		@ECHO Uploading on %1
		"%avrdudepath%" -v -patmega32u4 -cavr109 -P%1 -b57600 -D -Uflash:w:"%2":i
	)
) ELSE (
	@ECHO Config.bat not found
	@ECHO Please call Setup.bat and provide it with the path to your avrdude.exe
)
@ENDLOCAL
@GOTO :eof

:usage
@ECHO Usage: UploadHex COM# file.hex