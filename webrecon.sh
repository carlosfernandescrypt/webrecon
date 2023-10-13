cho "\033[33;5m----------------------------------------\033[0m"
echo "| -          WEB-RECON TOOL          - |"
echo "\033[33;5m----------------------------------------\033[0m"
echo " Usage: ./webrecon.sh http://site.com.br (extension ex: php) "
echo "\033[33;5m----------------------------------------\033[0m"
server=$(curl -s --head -H "User-Agent: xo0" $1 | grep "Server:" | cut -d " " -f2)
tech=$(curl -s --head -H "User-Agent: xo0" $1 | grep "X-Powered-By:" | cut -d " " -f2)
echo "\033[33;5m----------------------------------------\033[0m"
echo "-> WebServer identificado: $server"
echo "-> Tecnologias: $tech"
echo "\033[33;5m----------------------------------------\033[0m"

echo "\033[33;5m----------------------------------------\033[0m"
for palavra in $(cat lista.txt)
do
resposta=$(curl -s -H "User-Agent: xo0"  -o /dev/null -w "%{http_code}" $1/$palavra/)
if [ $resposta = 200 ]
then
echo "Diretorio encontrado: $1/$palavra/"
fi
done
echo "\033[33;5m----------------------------------------\033[0m"
for palavra in $(cat lista.txt)
do
resposta2=$(curl -s -H "User-Agent: xo0" -o /dev/null -w "%{http_code}" $1/$palavra)
if [ $resposta2 = 200 ]
then
echo "Arquivo encontrado: $1/$palavra"
fi
done
echo "\033[33;5m----------------------------------------\033[0m"
for palavra in $(cat lista.txt)
do
resposta3=$(curl -s -H "User-Agent: xo0" -o /dev/null -w "%{http_code}" $1/$palavra.$2)
if [ $resposta3 = 200 ]
then
echo "Arquivo $2 encontrado: $1/$palavra.$2"
fi
done
