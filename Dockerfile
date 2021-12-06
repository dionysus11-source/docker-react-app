FROM node:11 as bilder
WORKDIR /usr/src/app
COPY package.json .
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
COPY --from=bilder /usr/src/app/build /usr/share/nginx/html
