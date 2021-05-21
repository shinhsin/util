free -m |awk 'FNR==2{print $3" MB/"$2" MB"}'
#free -m |awk 'FNR==2{available=$2-$3} {print available" MB/"$2" MB"}'
