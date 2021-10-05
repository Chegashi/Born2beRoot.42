# \033[0;32m ``  \033[1;37m\n
echo -ne "#Architecture: \033[0;32m `uname -a`  \033[1;37m\n"
echo -ne "#CPU physical : \033[0;32m `grep -c ^processor /proc/cpuinfo`  \033[1;37m\n"
echo -ne "#vCPU : \033[0;32m `cat /proc/cpuinfo | grep processor | wc -l`  \033[1;37m\n"
echo -ne "#Memory Usage: \033[0;32m `free -m | awk 'NR==2{printf "%s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'`  \033[1;37m\n"
echo -ne "#Disk Usage: \033[0;32m `df -h | awk '$NF=="/"{printf "%d/%dGB (%s)\n", $3,$2,$5}'` \033[1;37m\n"
echo -ne "#CPU load: \033[0;32m `top -bn1 | grep load | awk '{printf "%.2f%%\n", $(NF-2)}'`  \033[1;37m\n"
echo -ne "#Last boot: \033[0;32m `who | awk '{print $3}' | tr '\n' ' ' && who | awk '{print $4}'`  \033[1;37m\n"
echo -ne "#LVM use: \033[0;32m `if cat /etc/fstab | grep -q "/dev/mapper/"; then echo "yes"; else echo "no"; fi`  \033[1;37m\n"
echo -ne "#Connexions TCP : \033[0;32m `cat /proc/net/tcp | wc -l | awk '{print $1-1}' | tr '\n' ' ' && echo "ESTABLISHED"`  \033[1;37m\n"; 
echo -ne "#User log : \033[0;32m `w | wc -l | awk '{print$1-2}'`  \033[1;37m\n"
echo -ne "#Network : \033[0;32m ` echo -n "IP " && ip route list | grep link | awk '{print $9}' | tr '\n' ' ' && echo -n "(" && ip link show | grep link/ether | awk '{print $2}' | tr '\n' ')' && printf "\n"`  \033[1;37m\n"
echo -ne "#Sudo : \033[0;32m `cat /var/log/sudo.log | wc -l | tr '\n' ' ' && echo "cmd"`  \033[1;37m\n"
printf "\n"