
NO_FORMAT="\033[0m"
C_SPRINGGREEN3="\033[38;5;35m"
C_INDIANRED1="\033[38;5;203m"
C_DODGERBLUE2="\033[38;5;27m"
#echo  "${C_SPRINGGREEN3}Put some color on me${NO_FORMAT}"

echo "${C_DODGERBLUE2}\n\n/*****************************/${NO_FORMAT}"
echo "${C_DODGERBLUE2}       building docker images     ${NO_FORMAT}"
echo "${C_DODGERBLUE2}/*****************************/\n${NO_FORMAT}"

# building nginx image
echo "${C_SPRINGGREEN3}\n${NO_FORMAT}"
echo "${C_SPRINGGREEN3}   !!!building nginx image${NO_FORMAT}"
echo "${C_SPRINGGREEN3}\n${NO_FORMAT}"
docker build -t nginx-image srcs/Nginx/

# building mysql image
echo "${C_SPRINGGREEN3}\n\n${NO_FORMAT}"
echo "${C_SPRINGGREEN3}   !!!building mysql image${NO_FORMAT}"
echo "${C_SPRINGGREEN3}\n${NO_FORMAT}"
docker build -t mysql-image srcs/MySQL/

# building phpmyadmin image
echo "${C_SPRINGGREEN3}\n\n${NO_FORMAT}"
echo "${C_SPRINGGREEN3}   !!!building phpmyadmin image${NO_FORMAT}"
echo "${C_SPRINGGREEN3}\n${NO_FORMAT}"
docker build -t phpmyadmin-image srcs/PhpMyAdmin/


# building Wordpress image
echo "${C_SPRINGGREEN3}\n\n${NO_FORMAT}"
echo "${C_SPRINGGREEN3}   !!!building Wordpress image${NO_FORMAT}"
echo "${C_SPRINGGREEN3}${NO_FORMAT}"
docker build -t wordpress-image srcs/Wordpress/

# building FTPS image
echo "${C_SPRINGGREEN3}\n\n${NO_FORMAT}"
echo "${C_SPRINGGREEN3}   !!!building ftps image"
echo "${C_SPRINGGREEN3}\n${NO_FORMAT}"
docker build -t ftps-image srcs/FTPS/




echo "${C_DODGERBLUE2}\n\n/*****************************/${NO_FORMAT}"
echo "${C_DODGERBLUE2}       depoloyenet      ${NO_FORMAT}"
echo "${C_DODGERBLUE2}/*****************************/${NO_FORMAT}"

echo "${C_SPRINGGREEN3}\n ${NO_FORMAT}"
echo "${C_SPRINGGREEN3}   ----> MetalLB --->${NO_FORMAT}"
echo "${C_SPRINGGREEN3}\n${NO_FORMAT}"
sh srcs/setup_metallb.sh

echo "${C_SPRINGGREEN3}\n ${NO_FORMAT}"
echo "${C_SPRINGGREEN3}   ----> Nginx --->${NO_FORMAT}"
echo "${C_SPRINGGREEN3}\n${NO_FORMAT}"
kubectl apply -f srcs/nginx-deployement.yaml

echo "${C_SPRINGGREEN3}\n ${NO_FORMAT}"
echo "${C_SPRINGGREEN3}   ----> MySQL --->${NO_FORMAT}"
echo "${C_SPRINGGREEN3}\n${NO_FORMAT}"

kubectl apply -f srcs/mysql-deployment.yaml

echo "${C_SPRINGGREEN3}\n ${NO_FORMAT}"
echo "${C_SPRINGGREEN3}   ----> FTPS --->${NO_FORMAT}"
echo "${C_SPRINGGREEN3}\n${NO_FORMAT}"
kubectl apply -f srcs/ftps-deployement.yaml

echo "${C_SPRINGGREEN3}\n ${NO_FORMAT}"
echo "${C_SPRINGGREEN3}   ----> PhpMyAdmin --->${NO_FORMAT}"
echo "${C_SPRINGGREEN3}\n${NO_FORMAT}"
kubectl apply -f srcs/phpmyadmin-deployement.yaml

echo "${C_SPRINGGREEN3}\n ${NO_FORMAT}"
echo "${C_SPRINGGREEN3}   ----> Wordpress --->${NO_FORMAT}"
echo "${C_SPRINGGREEN3}\n${NO_FORMAT}"
 kubectl apply -f srcs/wordpress-deployement.yaml 


echo "${C_SPRINGGREEN3}\n -- done --${NO_FORMAT}"
