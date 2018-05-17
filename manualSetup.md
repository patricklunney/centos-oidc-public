# Manual setup for mod_auth_openidc 
```
yum update -y
yum install vim httpd php -y
sudo yum install –y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y
yum install jansson -y
rpm -Uvh https://download.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages/c/cjose-0.5.1-1.fc28.src.rpm
curl -s -L -o ~/cjose-0.4.1-1.el7.centos.x86_64.rpm https://github.com/pingidentity/mod_auth_openidc/releases/download/v2.0.0/cjose-0.4.1-1.el7.centos.x86_64.rpm
yum localinstall -y ~/cjose-0.4.1-1.el7.centos.x86_64.rpm
rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/h/hiredis-0.12.1-1.el7.x86_64.rpm
yum install hiredis -y
rpm -Uvh https://rpmfind.net/linux/mageia/distrib/cauldron/x86_64/media/core/release/lib64pcre1-8.41-3.mga7.x86_64.rpm
rpm -Uvh https://github.com/zmartzone/mod_auth_openidc/releases/download/v2.3.0/mod_auth_openidc-2.3.0-1.el7.centos.x86_64.rpm
cp -iv mime.types /etc/httpd/conf/
```

## Grab the conf files and move them
```
mv oidc.conf /etc/httpd/conf.d/.
mv index.php /var/www/html/.
```
