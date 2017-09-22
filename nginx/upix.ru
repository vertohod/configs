server {
	listen						80;
	server_name					upix.ru www.upix.ru;
	rewrite						^(.*)$ http://www.ypix.ru permanent;
}
