# Base image – WSO2 Microgateway 3.2.8
FROM wso2/wso2micro-gw:3.2.8

# Set working directory – theo hướng dẫn của WSO2 Microgateway
WORKDIR /home/ballerina

EXPOSE 9090 9095

# Copy project artifacts
# Giả định bạn đã build project (ví dụ external-gw) và có thư mục chứa artifacts:
#   api_definitions/, target/*.jar, conf/micro-gw.conf, deployment-config.toml, etc.
COPY external-gw/target/external-gw.jar /home/exec/

# Các port mặc định của Microgateway runtime:
EXPOSE 9090 9095

# Khởi chạy Microgateway với project folder đã copy
ENTRYPOINT ["gateway", "/home/exec/external-gw.jar"]
