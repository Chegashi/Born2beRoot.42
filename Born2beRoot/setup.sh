#user

apt-get update
apt-get upgrade
apt-get install vim
apt-get install sudo
addgroup sudo 
usermod -a -G user42 mochegri
usermod -a -G sudo mochegri
reboot
apt update
mkdir /var/log/sudo

#sudo

echo 'Defaults	logfile="/var/log/sudo/sudo.log"' >> /etc/sudoers.d/rules
echo 'Defaults	passwd_tries=3' >> /etc/sudoers.d/rules
echo 'Defaults	badpass_message="Password is wrong, please try again"' >> /etc/sudoers.d/rules
echo 'Defaults	secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"' >> /etc/sudoers
echo 'Defaults  requiretty' >> /etc/sudoers.d/rules
echo 'Defaults        badpass_message="incorrect password:"' /etc/sudoers.d/rules
echo 'Defaults        log_input,log_output' >> /etc/sudoers.d/rules
echo 'Defaults        iolog_dir="/var/log/sudo"' >> /etc/sudoers.d/rules

#ssh

apt install openssh-server
awk '{ if (NR == 22) print "Port 4242"; else print $0}' /etc/ssh/sshd_config > tmp
awk '{ if (NR == 34) print "PermitRootLogin no"; else print $0}' tmp > /etc/ssh/sshd_config
  

#ufw:
apt install ufw
ufw enable
ufw allow 4242
awk '{ if (NR == 160) print "PASS_MAX_DAYS   30"; else print $0}' /etc/login.defs > tmp
awk '{ if (NR == 161) print "PASS_MIN_DAYS   2"; else print $0}' tmp > tmp2
awk '{ if (NR == 162) print "PASS_MIN_DAYS   2"; else print $0}' tmp2 > /etc/login.defs

# password

apt install libpam-pwquality

awk '{ if (NR == 25) print "password        requisite                       pam_pwquality.so retry=3 minlen=10 ucredit=-1 dcredit=-1 maxrepeat=3 reject_username difok=7 enforce_for_root"; else print $0}' tmp2 > /etc/login.defs
	scripte monitoring:

