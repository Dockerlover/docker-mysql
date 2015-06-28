# 基础镜像
FROM docker-ubuntu
# 维护人员
MAINTAINER  liuhong1.happy@163.com
# 添加环境变量
ENV USER_NAME admin
ENV SERVICE_ID mysql
ENV MYSQL_MAJOR 5.7
ENV MYSQL_VERSION 5.7.7-rc
# 安装mysql
RUN apt-get install -y perl  mysql-server="${MYSQL_VERSION}"* 
  && rm -rf /var/lib/apt/lists/* &&  rm -rf /var/lib/mysql && mkdir -p /var/lib/mysql
# 简单配置
RUN sed -Ei 's/^(bind-address|log)/#&/' /etc/mysql/my.cnf
# 设置mysql数据卷映射
VOLUME /var/lib/mysql
# 复制启动脚本
COPY start.sh /start.sh
# 暴露端口
EXPOSE 3306

# 配置supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# 启动supervisord
CMD ["/usr/bin/supervisord"]



