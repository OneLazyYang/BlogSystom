# 使用一个官方的 OpenJDK 作为基础镜像
FROM openjdk:11-jre-slim

# 可选：设置环境变量
ENV JAVA_OPTS=""

# 创建并设置工作目录，避免与基础镜像中的任何命名冲突
WORKDIR /app

# 将应用的 JAR 文件复制到容器中
COPY target/blogsystem.jar /app/blogsystem.jar

# 暴露应用运行的端口
EXPOSE 8080

# 定义容器启动时执行的命令
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar /app/blogsystem.jar"]