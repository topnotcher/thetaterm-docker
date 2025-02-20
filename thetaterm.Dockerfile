FROM alpine:3.21.3
RUN apk add openjdk21

ADD https://download-stable.thetadata.us ThetaTerminal.jar
EXPOSE 25511
EXPOSE 10001
EXPOSE 11001
CMD java -jar ThetaTerminal.jar --creds-file $THETADATA_CREDS_FILE
