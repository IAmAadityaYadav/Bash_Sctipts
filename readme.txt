This script is used for coping ssh public key on multiple servers only we need to edit the three files.
1). /etc/hosts
2). ~/password.enc
3). ~/copy_ssh_public_key.sh
=============================================================================================
=============================================================================================

1). /etc/hosts
In /etc/hosts files we need to reclare the all ip and hostname as like below example.
[root@master script]# cat /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
192.168.126.156 host1.abc.com
192.168.126.157 host2.abc.com

=============================================================================================
=============================================================================================

2). ~/password.enc

echo "your_password_here" | openssl enc -aes-256-cbc -salt -out password.enc -pass pass:your_encryption_passphrase

FYI... Replace your password with the string "your_password_here" and sava the file.  


=============================================================================================
=============================================================================================

3). ~/copy_ssh_public_key.sh

In this script we have the login to copy the files on multiple servers without any prompt.

=============================================================================================
=============================================================================================
