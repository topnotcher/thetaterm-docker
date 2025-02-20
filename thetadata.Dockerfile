FROM alpine:3.18.0
RUN apk add curl openjdk11 socat

RUN curl -L -o  ThetaTerminal.jar https://download-stable.thetadata.us
EXPOSE 25511
EXPOSE 10001
EXPOSE 11001
ENV THETADATA_USERNAME=default
ENV THETADATA_PASSWORD=default
CMD java -jar ThetaTerminal.jar $THETADATA_USERNAME $THETADATA_PASSWORD \
& socat TCP-LISTEN:25511,fork,reuseaddr TCP:127.0.0.1:25510 \
& socat TCP-LISTEN:10001,fork,reuseaddr TCP:127.0.0.1:10000 \
& socat TCP-LISTEN:11001,fork,reuseaddr TCP:127.0.0.1:11000
