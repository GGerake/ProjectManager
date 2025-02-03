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