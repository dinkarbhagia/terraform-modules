#cloud-config
package_update: true
package_upgrade: true
write_files:
  - content: |
      server {
        listen       80;
        listen       [::]:80;
        server_name  _;
        root         /data;

        # Load configuration files for the default server block.
        include /etc/nginx/default.d/*.conf;

        location /${geo} {
            try_files /${geo}/index.html =404;
        }

        error_page 404 /404.html;
        location = /40x.html {
        }

        error_page 500 502 503 504 /50x.html;
        location = /50x.html {
        } 
      }
    path: /tmp/default.conf
    permissions: '0654'
runcmd:
- amazon-linux-extras install -y nginx1
- service nginx start
- yum install -y amazon-efs-utils
- yum install -y nfs-utils
- mkdir -p /geo/${geo}
- test -f "/sbin/mount.efs" && printf "\n${file_system_dns}:/ /geo/${geo} nfs4 nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport,_netdev 0 0\n" >> /etc/fstab
- test -f "/sbin/mount.efs" && printf "\n[client-info]\nsource=liw\n" >> /etc/amazon/efs/efs-utils.conf
- retryCnt=15; waitTime=30; while true; do mount -a -t efs,nfs4 defaults; if [ $? = 0 ] || [ $retryCnt -lt 1 ]; then echo File system mounted successfully; break; fi; echo File system not available, retrying to mount.; ((retryCnt--)); sleep $waitTime; done;
- ln -s /geo/${geo} /data
- mkdir /data/${geo}
- echo "<h1>This is ${geo} Geo</h1>" > /data/${geo}/index.html
- mv /tmp/default.conf /etc/nginx/conf.d/
- chown -R nginx:nginx /geo/${geo}
- chmod -R 754 /geo/${geo}
- chown -R nginx:nginx /data
- chmod -R 754 /data
- service nginx restart