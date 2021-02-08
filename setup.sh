#
# building nginx image
echo "!!!building nginx image"
cd srcs/Nginx
docker build -t my/nginx .

