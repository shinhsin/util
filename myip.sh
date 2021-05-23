IP=$(curl https://ipinfo.io/ip 2>&-);echo "IP:$IP";geoiplookup $IP
