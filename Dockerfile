FROM openjdk:11-jre-slim
LABEL authors="amoryjar"

WORKDIR /app

COPY target/ms-config-server-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8888

HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD curl -f http://localhost:8888/actuator/health || exit 1

ENTRYPOINT ["java", "-jar", "app.jar"]