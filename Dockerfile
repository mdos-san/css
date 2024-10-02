FROM node:lts AS build
WORKDIR /app
COPY . .
RUN npm ci
RUN npm run build:style

FROM nginx
COPY --from=build /app/style.css /usr/share/nginx/html
