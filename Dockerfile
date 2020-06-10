# Start with a base image containing Java runtime
FROM 172.31.44.24:8083/openjdk:8-jdk-alpine

# Add Maintainer Info
MAINTAINER Praveen Kumar N<praveenkumar.nagarajan@gmail.com>

# environment variable with default value
ENV DB_DATABASE=${DATABASE}
ENV DB_USER=${USERNAME}
ENV DB_PASS=${PASS}

# Add a volume pointing to /tmp
VOLUME /tmp

# Make port 8080 available to the world outside this container
EXPOSE 8080

# The application's jar file
ARG JAR_FILE=target/websocket-demo-0.0.1-SNAPSHOT.jar

# Add the application's jar to the container
ADD ${JAR_FILE} websocket-demo.jar

# Run the jar file
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/websocket-demo.jar"]

