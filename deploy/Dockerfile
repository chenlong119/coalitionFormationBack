# 基础镜像
FROM hzkjhub/java17:17.0.4
# 在镜像中创建一个目录来存放应用程序
RUN mkdir /app

# 设置工作目录
WORKDIR /app

# 将本地的 Spring Boot 可执行 JAR 文件复制到镜像中的 /app 目录
COPY target/ruoyi.jar /app/app.jar

# 暴露 Spring Boot 应用程序的端口（假设 Spring Boot 应用程序使用8080端口）
EXPOSE 8080

# 定义启动命令，运行 Spring Boot 应用程序
CMD ["java", "-jar", "app.jar"]