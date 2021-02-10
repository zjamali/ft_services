# install metal lb
echo "!!! installing metallb "
sh srcs/setup_metallb.sh

# building nginx image

echo "!!!building nginx image"
docker build -t nginx-image srcs/Nginx/

# building mysql image

echo "!!!building mysql image"
docker build -t mysql-image srcs/MySQL/

# building phpmyadmin image
echo "!!!building phpmyadmin image"
docker build -t phpmyadmin-image srcs/PhpMyAdmin/


# building Wordpress image
echo "!!!building phpmyadmin image"
docker build -t wordpress-image srcs/Wordpress/
