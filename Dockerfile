FROM node:alpine AS build-web
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=build-web /app/build /usr/share/nginx/html

