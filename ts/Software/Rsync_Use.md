##

- ci 打包到指定目录
- 下载 tar 包
- 解压 tar 包
- 部署



### Install Rsync

```
yum install rsync
```



### Rsync Config



```
pid file = /var/run/rsyncd.pid
port = 5201
uid = root
gid = root

use chroot = yes
read only = yes

hosts allow= 218.253.222.21 218.253.222.19 218.253.222.18 47.244.101.189 47.244.231.72
hosts deny=*

max connections = 5000
motd file = /etc/rsyncd/rsyncd.motd

log file = /etc/rsyncd/rsyncd.log
#
##This will log every file transferred - up to 85,000+ per user, per sync
transfer logging = yes
#
log format = %t %a %m %f %b
syslog facility = local3
timeout = 300
#
#
[dp]
path = /www/web/agentfront
list=no
ignore errors
auth users = devops
secrets file = /etc/rsyncd/rsyncd.secret
comment = This is RHEL 4 data
```



```shell
sudo rsync -arv --password-file=/etc/rsyncd/rsync.d.secret --port=5201 devops@hostname::adminfront_test /home/game/nginx/html/admin_www/
```



### Open Firewall

```shell
iptables -A INPUT -p tcp --dport 5201 -j ACCEPT
```

### Start Service

```shell
service rsyncd start
```

### Fetch file from rsyncd service

```shell
sudo rsync -arv --password-file=/etc/rsyncd/rsync.d.secret --port=5201 devops@47.244.231.72::dp/rg .
```

sudo rsync -arv --password-file=/etc/rsyncd/rsync.d.secret --port=5201 devops@127.0.0.1::dp/rg .