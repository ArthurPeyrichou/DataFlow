@echo off
set /p dockerip="Please write the Docker virtual machine ip (ex: 192.168.99.100), followed by [ENTER]:"

echo [92mPrerequisite starting.[0m
git clone https://github.com/ArthurPeyrichou/FlowFrontend.git frontend
git clone https://github.com/ArthurPeyrichou/FlowBackend.git backend

CD backend/components/ 
git clone https://github.com/ArthurPeyrichou/FlowComponents
CD FlowComponents/components/ 
MOVE * ../../
CD ../../
RMDIR FlowComponents /S /Q

CD ../../frontend

    setlocal enableextensions disabledelayedexpansion

    set "replace=VUE_APP_BACKEND_URL=ws://%dockerip%:5001"
    set "textFile=.env.production"

    for /f "delims=" %%i in ('type "%textFile%" ^& break ^> "%textFile%" ') do (
        set "line=%%i"
        setlocal enabledelayedexpansion
        IF "!line:VUE_APP_BACKEND_URL=_!"=="!line:_=_!" (>>"%textFile%" echo !line:_=_!) ELSE (>>"%textFile%" echo %replace%)
        endlocal
    )

echo [92mPrerequisite finished, type Enter to start docker.[0m
pause

echo [92mDocker starting.[0m
docker-compose up -d
echo [92mDocker finished.[0m
echo [92mTool ready on http://%dockerip%:4200, type Enter to close.[0m
pause