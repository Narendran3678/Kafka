@echo off
d:
cd .\Software\Study_Software\kafka\


set "META_FILE=D:\Software\Study_Software\kafka\logs\kraft-combined-logs\meta.properties"
set "KAFKA_CLUSTER_ID="

if exist "%META_FILE%" (
    for /f "tokens=2 delims==" %%i in ('findstr "^cluster.id=" "%META_FILE%"') do set "KAFKA_CLUSTER_ID=%%i"
)

if "%KAFKA_CLUSTER_ID%"=="" (
    for /f "tokens=*" %%i in ('bin\windows\kafka-storage.bat random-uuid') do set "KAFKA_CLUSTER_ID=%%i"
)

echo Kafka Cluster ID: %KAFKA_CLUSTER_ID%

.\bin\windows\kafka-server-start.bat .\config\server.properties