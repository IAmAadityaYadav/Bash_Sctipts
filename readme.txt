This script is used for coping ssh public key on multiple servers only we need to edit the three files:
1). /etc/hosts
2). ~/password.enc
3). ~/copy_ssh_public_key.sh

=============================================================================================
=============================================================================================

Pre-requestics are:

ssh services should up and running. To check the status use below cmd.
# systemctl status sshd 

Create ssh key by using below cmd:
# ssh-keygen

Generating public/private rsa key pair.
Enter file in which to save the key (/root/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /root/.ssh/id_rsa
Your public key has been saved in /root/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:O4J9SFiwX3CbDhUYI+CorSO0ery4OKJ5jOJ3dPlkdJQ root@master.abc.com
The key's randomart image is:
+---[RSA 3072]----+
|  ..o +o+.  .    |
| o   +.= o E     |
|. . . o + .      |
|..   + + . .     |
|... . o S .      |
|...  = + +       |
|+=  o = B        |
|O+=. . o o       |
|%*o..            |
+----[SHA256]-----+

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

# chmod 600 password.enc

=============================================================================================
=============================================================================================

3). ~/copy_ssh_public_key.sh

In this script we have the login to copy the files on multiple servers without any prompt.

# chmod 700 ~/copy_ssh_public_key.sh

=============================================================================================
=============================================================================================


