FROM openjdk:17-alpine

ENV APP_FILE target/spring-petclinic-3.3.0-SNAPSHOT.jar

ENV APP_HOME /usr/apps

EXPOSE 8080

COPY . /$APP_FILE $APP_HOME/

WORKDIR $APP_HOME

ENTRYPOINT ["sh", "-c"]

CMD ["exec java -jar $APP_FILE"]