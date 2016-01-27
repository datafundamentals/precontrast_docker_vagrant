cd ~/work/mysql
docker pull mysql
docker images
docker ps
docker run --name contrast-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql
docker ps