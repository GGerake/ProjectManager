FROM python:3.12-alpine

# definindo diretório  de trabalho dentro do container
WORKDIR /app/ 

# Instalando pacotes necessários para compilação
RUN apk add --no-cache gcc musl-dev python3-dev libffi-dev openssl-dev postgresql-dev

RUN pip install --upgrade pip

# o requirements.txt ficara na pasta raiz
COPY ./requirements.txt ./requirements.txt

# o diretório completo local será copiado para a pasta ./app/ (no caso o workdir)
COPY . ./

# da permissão para o script shell
RUN chmod +x docker/wait-for-it.sh

# ese comando será executado no workdir (pasta ./app)
RUN pip install -r requirements.txt

# expondo a porta do django
EXPOSE 8000

# CMD [ "ls" ]
CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]