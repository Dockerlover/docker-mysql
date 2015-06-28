# 基础镜像
FROM docker-ubuntu
# 维护人员
MAINTAINER  liuhong1.happy@163.com
# 安装mysql
RUN apt-get install -y perl --no-install-recommends && apt-get install -y mysql-server="${MYSQL_VERSION}"* 
  && rm -rf /var/lib/apt/lists/* &&  rm -rf /var/lib/mysql && mkdir -p /var/lib/mysql
# 简单配置
RUN sed -Ei 's/^(bind-address|log)/#&/' /etc/mysql/my.cnf
# 设置mysql数据卷映射
VOLUME /var/lib/mysql
# 复制启动脚本
COPY docker-entrypoint.sh /entrypoint.sh
# 暴露端口
EXPOSE 3306

# 配置supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# 启动supervisord
CMD ["/usr/bin/supervisord","/bin/bash"]


