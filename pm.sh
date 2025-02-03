#!/bin/bash

# Definir cores para mensagens
PURPLE="\e[95m"
GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
RESET="\e[0m"

NAME="ProjectManager"

echo -e "${GREEN}---------------------------------------------------${GREEN}"
echo -e "${PURPLE}Gerenciador de comandos Docker do ${NAME}${RESET}"
echo -e "${GREEN}---------------------------------------------------${GREEN}"

# Verifica se foi passado o ambiente (dev ou prod)
if [ -z "$1" ]; then
    echo -e "${RED}[ERRO]🫵  Você deve informar o ambiente: dev ou prod${RESET}"
    exit 1
fi

# Verifica se foi passado um argumento de ação
if [ -z "$2" ]; theln
    echo -e "${RED}[ERRO]🫵  Você deve informar um comando: up, down, stop, start, rebuild${RESET}"
    exit 1
fi

# Define o caminho do arquivo docker-compose
DOCKER_COMPOSE_FILE="docker/$1/docker-compose.$1.yml"

# Verifica se o arquivo docker-compose existe
if [ ! -f "$DOCKER_COMPOSE_FILE" ]; then
    echo -e "${RED}[ERRO]☠️  Arquivo $DOCKER_COMPOSE_FILE não encontrado!${RESET}"
    exit 1
fi

# Executa o comando com base no segundo argumento
case "$2" in
    up)
        echo -e "${YELLOW}[INFO]🛫 Subindo os containers do ambiente $1...${RESET}"
        docker-compose -f "$DOCKER_COMPOSE_FILE" up -d
        ;;
    down)
        echo -e "${YELLOW}[INFO]🧹 Removendo os containers do ambiente $1...${RESET}"
        docker-compose -f "$DOCKER_COMPOSE_FILE" down
        ;;
    stop)
        echo -e "${YELLOW}[INFO]🛑 Parando os containers do ambiente $1...${RESET}"
        docker-compose -f "$DOCKER_COMPOSE_FILE" stop
        ;;
    start)
        echo -e "${YELLOW}[INFO]▶️  Iniciando os containers do ambiente $1...${RESET}"
        docker-compose -f "$DOCKER_COMPOSE_FILE" start
        ;;
    rebuild)
        echo -e "${YELLOW}[INFO]🐣 Recriando os containers do ambiente $1...${RESET}"
        docker-compose -f "$DOCKER_COMPOSE_FILE" up --build -d
        ;;
    *)
        echo -e "${RED}[ERRO]🫵  Comando inválido! Use: up, down, stop, start, rebuild${RESET}"
        exit 1
        ;;
esac
