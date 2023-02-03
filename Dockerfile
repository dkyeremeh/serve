FROM node:lts-alpine

ARG VERSION=latest

WORKDIR /var/static
RUN yarn global add serve@${VERSION}

EXPOSE 8080

ENTRYPOINT ["serve", "-l", "8080"]