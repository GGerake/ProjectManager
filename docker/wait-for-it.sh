# wait-for-it.sh: aguarda um serviço estar pronto antes de continuar.

# nesse caso espera o banco de dados dicar pronto antes de executar o migrate do Django

host="$1"
port="$2"
shift 2
cmd="$@"

while ! nc -z "$host" "$port"; do
  echo "Aguardando $host:$port..."
  sleep 2
done

echo "$host:$port está pronto. Executando comando..."
exec $cmd