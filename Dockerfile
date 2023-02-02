FROM node:lts-alpine

WORKDIR /var/static
RUN yarn global add serve

EXPOSE 8080

CMD ["/usr/local/bin/serve", "-l", "8080"]