# install metal lb
echo "!!! installing metallb "
sh srcs/setup_metallb.sh

# building nginx image

echo "!!!building nginx image"
cd srcs/Nginx
docker build -t nginx-image .

# building nginx image
cd ../..
echo "!!!building mysql image"
cd srcs/MySQL
docker build -t mysql-image .

# building nginx image
cd ../..
echo "!!!building phpmyadmin image"
cd srcs/PhpMyAdmin
docker build -t phpmyadmin-image .


