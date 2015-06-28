# docker-mysql
Docker化mysql

## 镜像特点

- 2015/6/28 继承基础镜像docker-ubuntu

## 使用方法

- 获取代码并构建

        git clone https://github.com/Dockerlover/docker-mysql.git
        cd docker-mysql
        docker build -t docker-mysql .

- 运行容器

        docker run -d -it --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root docker-mysql
