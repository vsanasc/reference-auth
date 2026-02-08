FROM eclipse-temurin:11-jdk-jammy

WORKDIR /app

COPY reference-auth-server-webapp/target/hspc-reference-auth-server-webapp*.war app.war

COPY reference-auth-server-webapp/target/dependency/jetty-runner.jar jetty-runner.jar

COPY reference-auth-server-webapp/src/main/resources/jetty.xml jetty.xml

ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar jetty-runner.jar --config jetty.xml app.war" ]
