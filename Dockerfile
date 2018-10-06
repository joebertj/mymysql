FROM mysql:5.7

RUN apt-get update && apt-get --no-install-recommends --no-install-suggests -y install expect

ENV MYSQL_ROOT_PASSWORD=MzDzgWhBvMRRz5KmDyNky5uX4HXSkH
ENV MYSQL_DATABASE=mydb
ENV MYSQL_USER=joebertj
ENV MYSQL_PASSWORD=7U77855bUaZJFsivEU5gg83JZAPXeF

ADD mydb.sql /docker-entrypoint-initdb.d/

ADD mysql_config.sh /root/mysql_config.sh
RUN cd /root && chmod +x mysql_config.sh && ./mysql_config.sh $MYSQL_ROOT_PASSWORD local root && ./mysql_config.sh $MYSQL_PASSWORD client $MYSQL_USER
