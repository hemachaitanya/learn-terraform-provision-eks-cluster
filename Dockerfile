FROM ubuntu:latest
RUN apt update && apt install openjdk-17-jdk -y && apt install maven -y && apt install git -y 
RUN git clone https://github.com/spring-projects/spring-petclinic.git  
WORKDIR /spring-petclinic
RUN mvn package
WORKDIR  /target
EXPOSE 8080
CMD ["java" , "-jar" , "spring-petclinic-3.0.0-SNAPSHOT.jar"]