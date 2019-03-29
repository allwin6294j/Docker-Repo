FROM node:alpine as allash
WORKDIR '/app-nodejs'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=allash /app-nodejs/build /usr/share/nginx/html