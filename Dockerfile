FROM node:lts-alpine

WORKDIR /var/static
RUN yarn global add serve

EXPOSE 8080

ENTRYPOINT ["serve", "-l", "8080"]