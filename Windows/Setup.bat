@IF [%1] == [] (
	@SET /p avrdudepath=Input path to avrdude.exe:
) ELSE (
	@SET avrdudepath="%~f1"
)

@IF EXIST %avrdudepath% (
	@COPY NUL Config.bat > NUL
	(@ECHO @SET avrdudepath=%avrdudepath%) >> Config.bat
	@ECHO Config.bat saved
) ELSE (
	@ECHO Specified file does not exist:
	@ECHO %avrdudepath%
)
