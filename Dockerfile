FROM node:alpine AS build-web
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=build-web /app/build /usr/share/nginx/html

