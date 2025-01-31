@echo off
chcp 65001 >nul
echo Gerenciador de comandos Docker do ProjectManager

:: Definir cores para mensagens
set GREEN=[32m
set YELLOW=[33m
set RED=[31m
set RESET=[0m



:: Verifica se foi passado um argumento
if "%2"=="" (
    echo %RED%[ERRO]🫵  Você deve informar um comando: run, stop, start, rebuild%RESET%
    exit /b 1
)

:: Verifica se foi passado o ambiente (dev ou prod)
if "%1"=="" (
    echo %RED%[ERRO]🫵  Você deve informar o ambiente: dev ou prod%RESET%
    exit /b 1
)

:: Define o caminho do arquivo docker-compose
set DOCKER_COMPOSE_FILE=docker/%1/docker-compose.%1.yml

:: Verifica se o arquivo docker-compose existe
if not exist "%DOCKER_COMPOSE_FILE%" (
    echo %RED%[ERRO]☠️  Arquivo %DOCKER_COMPOSE_FILE% não encontrado!%RESET%
    exit /b 1
)

:: Executa o comando com base no primeiro argumento
if "%2"=="up" (
    echo %YELLOW%[INFO]🛫 Subindo os containers do ambiente %1...%RESET%
    docker-compose -f %DOCKER_COMPOSE_FILE% up -d
    exit /b 0
)

if "%2"=="down" (
    echo %YELLOW%[INFO]🧹 Removendo os containers do ambiente %1...%RESET%
    docker-compose -f %DOCKER_COMPOSE_FILE% down
    exit /b 0
)

if "%2"=="stop" (
    echo %YELLOW%[INFO]🛑 Parando os containers do ambiente %1...%RESET%
    docker-compose -f %DOCKER_COMPOSE_FILE% stop
    exit /b 0
)

if "%2"=="start" (
    echo %YELLOW%[INFO]▶️  Iniciando os containers do ambiente %1...%RESET%
    docker-compose -f %DOCKER_COMPOSE_FILE% start
    exit /b 0
)

if "%2"=="rebuild" (
    echo %YELLOW%[INFO]🐣 Recriando os containers do ambiente %1...%RESET%
    docker-compose -f %DOCKER_COMPOSE_FILE% up --build -d
    exit /b 0
)





