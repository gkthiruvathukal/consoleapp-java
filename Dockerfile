FROM openjdk:11
COPY . /usr/src/consoleapp-java
WORKDIR /usr/src/consoleapp-java
RUN ./gradlew compileJava jar
