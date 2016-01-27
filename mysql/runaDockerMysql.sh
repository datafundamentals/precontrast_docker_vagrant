cd ~/work/mysql
docker build -t contrast/mysql_a .
docker images
docker ps
docker run --name contrast-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d contrast/mysql_a 
