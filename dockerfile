FROM alpine as builder

RUN apk add --no-cache curl

WORKDIR /usr/plugins

RUN curl -OL https://github.com/SonarOpenCommunity/sonar-cxx/releases/download/cxx-1.3.2/sonar-c-plugin-1.3.2.1853.jar \
    && curl -OL https://github.com/SonarOpenCommunity/sonar-cxx/releases/download/cxx-1.3.2/sonar-cxx-plugin-1.3.2.1853.jar

FROM sonarqube:lts


COPY --from=builder /usr/plugins /opt/sonarqube/extensions/plugins