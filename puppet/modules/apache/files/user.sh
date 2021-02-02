servername='serverdns'
useradd jenkins-user
chown -R jenkins-user.jenkins-user /var/www/$servername
chmod 770 /var/www/$servername
usermod -a -G www-data jenkins-user
su jenkins-user
cd /var/www/$servername
mkdir .ssh
chmod 700 .ssh
cd ..
cd ..
yes | ssh-keygen -o -a 100 -t rsa -f /var/www/$servername/.ssh/jenkins-key -N ""
cd /var/www/$servername
mkdir .ssh
mkdir authorized_keys
chmod 600 authorized_keys
cat jenkins-key.pub > authorized_keys
scp /var/www/$servername/.ssh/jenkins-user.pub ubuntu@ip.compute-1.amazonaws.com:~/.ssh/authorized_keys

