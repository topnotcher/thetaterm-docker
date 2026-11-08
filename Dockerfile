FROM alpine:3.21.3
RUN apk add openjdk21

ADD https://download-unstable.thetadata.us/ThetaTerminalv3.jar ThetaTerminal.jar

EXPOSE 25503
LABEL org.opencontainers.image.source = "https://github.com/topnotcher/thetaterm-docker"
LABEL org.opencontainers.image.description = "Docker image for ThetaTerminal"

COPY entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]
