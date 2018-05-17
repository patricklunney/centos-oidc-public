# Apache Web Server with mod_auth_oidc on Centos

We made this as a proof of concept that we can run an SSO enabled web server using Open ID Connect with an httpd web server inside a container(s)

It has PHP installed on it, but you could easily change that or add support for reverse proxies for other types of apps.


`docker build . -t <username>/centos-oidc`

### To Run:

Make sure you add your client id, secret, and redirect uri. I would advise setting the redirect URI to port 80 for simplicity.

```
sudo docker run --rm \
-p 80:80 \
-e METADATA= \
-e CLIENT_ID=<client_id> \
-e CLIENT_SECRET=<client_secret> \
-e REDIRECT_URI=http://localhost/redirect_uri \
<username>/centos-oidc:latest
```

Link it with your amazing PHP web app.

```
sudo docker run --rm \
-v /Users/briansimoni/amazing-php-app/:/var/www/html/ \
-p 80:80 \
--add-host="fssfed.ge.com:8.23.90.173" \
-e CLIENT_ID= \
-e CLIENT_SECRET= \
-e REDIRECT_URI= \
<username>/centos-oidc:latest
```
