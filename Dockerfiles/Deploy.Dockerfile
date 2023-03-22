# build stage
FROM node:lts AS build-stage

WORKDIR /vue_app

COPY package.json ./

RUN yarn install

COPY . .

RUN yarn run build

# production stage
FROM nginx AS production-stage

COPY --from=build-stage /vue_app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]