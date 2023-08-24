docker run -it --rm -v nginx_certbot:/etc/letsencrypt -p 80:80 certbot/certbot certonly --standalone -d rehadat.com --agree-tos --email qshey@gmail.com --non-interactive --keep-until-expiring
openssl req -newkey rsa:4096 -nodes -keyout nginx.key -x509 -days 365 -out nginx.crt
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout key.pem -out cert.pem
docker run -p 80:80 -p 443:443 -v /path/to/nginx/config/nginx.conf:/etc/nginx/nginx.conf -v /path/to/nginx/certs:/etc/nginx/certs -v /usr/share/nginx/html:/usr/share/nginx/html nginx
openssl genpkey -algorithm RSA -out root.key.pem
openssl req -x509 -new -key root.key.pem -sha256 -out root.cert.pem
openssl req -new -nodes -out localhost.csr.pem -keyout localhost.key.pem
openssl x509 -req -in localhost.csr.pem -CA root.cert.pem -CAkey root.key.pem -CAcreateserial -out localhost.cert.pem
docker run -p 80:80 -p 443:443 -v /path/to/nginx/config/nginx.conf:/etc/nginx/nginx.conf -v /path/to/nginx/certs:/etc/nginx/certs -v /usr/share/nginx/html:/usr/share/nginx/html nginx