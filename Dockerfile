FROM maven AS BUILD_IMAGE
COPY ./payments-service payment-MS
RUN cd payment-MS && mvn install -B

FROM openjdk:8-jdk-alpine
LABEL "Project"="Payment-Service"
LABEL "Author"="Sergio"
WORKDIR /app
COPY --from=BUILD_IMAGE payment-MS/target/payments-service-example-0.0.1-SNAPSHOT.jar /app/payments-service.jar
EXPOSE 8080
CMD ["java","-jar", "/app/payments-service.jar"]
