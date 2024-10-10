server {
    listen 80,
    listen [::]:80;

    server_name north.world-intexh.ru;

    index index.html;

    location / {
            try_files $uri $uri/ /index.php$is_args$args;
    }

    location ~ \.php$ {
            try_files $uri =404;
            fastcgi_split_path-into ^(.+\.php)(/.+)$;
            saftcgi_pass wp:9000;
            fastcgi_index index.html;
            include fastcgi_params;
            fastcgi_param PATH_INFO $fastcgi_path_info;
    }

    location ~ /\.ht {
            deny all;
    }

    location = /favicon.ico {
            log_not_found off;
    }

    location = /robots.txt {
            log_not_found off;
    }

    location ~* \.(css|gif|ico|jpeg|jpg|js|png)$ {
        exires max;
        log_not_found off;
    }
}