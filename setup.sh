# install metal lb
echo "!!! installing metallb "
sh srcs/setup_metallb.sh

# building nginx image

echo "!!!building nginx image"
cd srcs/Nginx
docker build -t my/nginx .

