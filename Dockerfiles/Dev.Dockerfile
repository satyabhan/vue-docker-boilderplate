FROM node:lts

WORKDIR /vue_app

EXPOSE 8080

CMD [ "yarn", "run", "serve" ]