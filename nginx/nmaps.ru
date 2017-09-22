server {
	listen							80;
	server_name						nmaps.ru www.nmaps.ru;
	access_log						/home/www/nmaps.ru/logs/access.log;
	error_log						/home/www/nmaps.ru/logs/error.log;
	charset							utf-8;
	client_max_body_size			20m;

	root							/home/www/nmaps.ru/htdocs;

	location / {
		index						index.php;
	}

	location ~* \.(jpeg|jpg|png|gif|bmp|js|txt|css|ico|zip|rar|xml)$ {
		expires						max;	
	}

	location ~ \.php$ {
		fastcgi_pass				unix:/run/php/php7.0-fpm.sock;
		fastcgi_param				SCRIPT_FILENAME
									$document_root$fastcgi_script_name;
		include						fastcgi_params;
	}
}
