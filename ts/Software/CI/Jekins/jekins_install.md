### Run by Docker

```shell
sudo docker run \
-u root \
--rm \
-d \
-p 8080:8080 \
-p 50000:50000 \
-v /opt/jenkins_home:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
 jenkinsci/blueocean
```







### Reverse Proxy by Nginx

```nginx
upstream jenkins {
    server 127.0.0.1:8080 fail_timeout=0;
}

map $http_upgrade $connection_upgrade {
        default upgrade;
        '' close;
}

server {
    listen 80;
    server_name pornhub.hj.rgdemon.com;

    location / {
      sendfile off;
      proxy_pass         http://jenkins;
      proxy_redirect     default;
      proxy_http_version 1.1;

      # Required for Jenkins websocket agents
      proxy_set_header   Connection        $connection_upgrade;
      proxy_set_header   Upgrade           $http_upgrade;

      proxy_set_header   Host              $host;
      proxy_set_header   X-Real-IP         $remote_addr;
      proxy_set_header   X-Forwarded-For   $proxy_add_x_forwarded_for;
      proxy_set_header   X-Forwarded-Proto $scheme;
      proxy_max_temp_file_size 0;

      #this is the maximum upload size
      client_max_body_size       10m;
      client_body_buffer_size    128k;

      proxy_connect_timeout      90;
      proxy_send_timeout         90;
      proxy_read_timeout         90;
      proxy_buffering            off;
      proxy_request_buffering    off; # Required for HTTP CLI commands
      proxy_set_header Connection ""; # Clear for keepalive
  }
}


```



### Check Initial Password

```shell
cat /opt/jenkins_home/secrets/initialAdminPassword
```

### Install Plugin

Request will be banned by waf of openresty when install jenkins plugin. Firstly, close the waf of openresty.

install gitlab web hook

1. install gitlab plugin
2. generate key
3. config web hook on gitlab.com

install nodejs and config



### Create Project



### Set Build Config



```shell
npm install 
rm -rf dist 
npm run build 
```



### Publish Over SSH

1. 生成 ssh 密钥

   ```shell
   ssh-keygen -t rsa -b 4096 -C "jamestime2023@gamil.com"
   ```

2. 生成密钥位置

   ```shell
   Enter a file in which to save the key (/home/you/.ssh/id_rsa)
   ```







