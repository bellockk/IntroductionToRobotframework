@echo off
Setlocal enabledelayedexpansion
Set >set
For /F "tokens=1* delims==" %%i in (set) do set %% %i =
Del set
FOR /F "tokens=* USEBACKQ" %%F IN (`python -c "import tempfile; print(tempfile.mkdtemp())"`) DO (
SET temp_directory=%%F
)
echo "Temp Directory: %temp_directory%"
virtualenv "%temp_directory%/local"
"%temp_directory%/local/bin/pip" install robotframework
"%temp_directory%/local/bin/robot" "%~dp0../src/SUT.robot"
@RD /S /Q "%temp_directory%"
