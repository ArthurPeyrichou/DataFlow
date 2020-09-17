@echo off
set /p dockerip="Please write the Docker virtual machine ip:"
echo %dockerip%
@echo on

echo "Prerequisite starting"
git clone https://github.com/ArthurPeyrichou/FlowFrontend.git frontend
git clone https://github.com/ArthurPeyrichou/FlowBackend.git backend

CD backend/components/ 
git clone https://github.com/ArthurPeyrichou/FlowComponents
CD FlowComponents/components/ 
MOVE * ../../
CD ../../
RMDIR FlowComponents /S /Q

CD ../../frontend

@echo off 
    setlocal enableextensions disabledelayedexpansion

    set "search=VUE_APP_BACKEND_URL=to_complete"
    set "replace=ws://%dockerip%:5001"
    set "textFile=.env.production"

    for /f "delims=" %%i in ('type "%textFile%" ^& break ^> "%textFile%" ') do (
        set "line=%%i"
        setlocal enabledelayedexpansion
        IF "!line:VUE_APP_BACKEND_URL=_!"=="!line:_=_!" (>>"%textFile%" echo !line:_=_!) ELSE (>>"%textFile%" echo !line:to_complete=%replace%!)
        endlocal
    )
@echo on
echo "Prerequisite finished, click to start docker"
pause

echo "Docker starting"
docker-compose up -d
echo "Docker finished"

echo "Tool ready on %dockerip%:4200"